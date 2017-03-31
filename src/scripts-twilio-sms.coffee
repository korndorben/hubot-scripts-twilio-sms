# Description:
#   发送短信至指定手机号码
#
# Dependencies:
#   "twilio": "^2.11.1"
#
# Configuration:
#   TWILIO_SID
#   TWILIO_TOKEN
#   TWILIO_SOURCEPHONENUMBER
#
# Commands:
#   hubot sms targetphonenumber#sms-content
#
# Author:
#   korndorben

accountSid = process.env.TWILIO_SID
authToken = process.env.TWILIO_TOKEN
fromPhonenumber = process.env.TWILIO_SOURCEPHONENUMBER

client = require('twilio')(accountSid, authToken);

module.exports = (robot) ->
    robot.respond /sms(?:\s+(.*))?$/i, (msg) ->
        console.log msg
        filter = msg.match[1]
        phonenumber = filter.split('#')[0]
        content = filter.split('#')[1]
        if filter
            client.messages.create({
                to: phonenumber,
                from: fromPhonenumber,
                body: content,
            },(err, message) =>
                msg.reply message.sid
            );
        return
