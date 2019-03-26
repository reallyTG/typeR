library(blastula)


### Name: send_by_mailgun
### Title: Send an email message through the Mailgun API
### Aliases: send_by_mailgun

### ** Examples

## Not run: 
##D # Create a simple email message using
##D # Markdown formatting
##D email <-
##D   compose_email(
##D   body = "
##D   Hello!
##D 
##D   ## This a section heading
##D 
##D   We can use Markdown formatting \\
##D   to **embolden** text or to add \\
##D   *emphasis*. This is exciting, \\
##D   right?
##D 
##D   Cheers")
##D 
##D # Generate a vector of recipients
##D recipient_list <-
##D   c("person_1@site.net",
##D     "person_2@site.net")
##D 
##D # Send it to multiple people through
##D # the Mailgun API
##D email %>%
##D   send_by_mailgun(
##D     subject = "Sent through Mailgun",
##D     from = "The Sender <sender@send.org>",
##D     recipients = recipient_list,
##D     url = "<..mailgun_sending_domain..>",
##D     api = "<..mailgun_api_key..>")
## End(Not run)



