library(blastula)


### Name: prepare_test_message
### Title: Prepare a email test message object
### Aliases: prepare_test_message

### ** Examples

## Not run: 
##D # Create a credentials file to
##D # send via Gmail (this will be named
##D # `.bls_smtp_gmail_com`)
##D create_email_creds_file(
##D   user = "username@gmail.com",
##D   password = "*************",
##D   provider = "gmail",
##D   sender = "Sender Name")
##D 
##D # Send oneself a test message to
##D # test these new SMTP settings
##D send_email_out(
##D   message = prepare_test_message(),
##D   sender = "Sender Name",
##D   subject = "test 2",
##D   from = "username@gmail.com",
##D   to = "username@gmail.com",
##D   creds_file = ".bls_smtp_gmail_com")
## End(Not run)



