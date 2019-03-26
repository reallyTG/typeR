library(mailR)


### Name: send.mail
### Title: Send emails from R
### Aliases: send.mail

### ** Examples

sender <- "sender@gmail.com"  # Replace with a valid address
recipients <- c("receiver1@gmail.com")  # Replace with one or more valid addresses
email <- send.mail(from = sender,
                   to = recipients,
                   subject="Subject of the email",
                   body = "Body of the email",
                   smtp = list(host.name = "aspmx.l.google.com", port = 25),
                   authenticate = FALSE,
                   send = FALSE)
## Not run: email$send() # execute to send email



