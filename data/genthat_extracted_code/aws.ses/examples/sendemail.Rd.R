library(aws.ses)


### Name: send_email
### Title: Send Email via SES
### Aliases: get_quota get_statistics send_email

### ** Examples

## Not run: 
##D # verify email address
##D verify_identity("me@example.com")
##D 
##D # if email verified, can be used to send a message
##D a <- get_verification_attrs("me@example.com")
##D if (a[[1]]$VerificationStatus == "Success") {
##D   # simple plain-text email
##D   send_email("Test Email Body", subject = "Test Email", 
##D              from = "me@example.com", to = "recipient@example.com")
##D 
##D   # html and plain text versions
##D   send_email(message = "Plain text body", 
##D              html = "<div><p style='font-weight=bold;'>HTML text body</p></div>", 
##D              subject = "Test Email", 
##D              from = "me@example.com", to = "recipient@example.com")
##D }
## End(Not run)
## Not run: 
##D get_quota()
##D get_statistics()
## End(Not run) 



