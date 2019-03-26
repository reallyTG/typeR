library(twilio)


### Name: tw_message_tbl
### Title: Make a Data Frame from a Messages List
### Aliases: tw_message_tbl

### ** Examples

## Not run: 
##D 
##D # Set API credentials
##D # You only need to do this once per R session
##D Sys.setenv(TWILIO_SID = "M9W4Ozq8BFX94w5St5hikg7UV0lPpH8e56")
##D Sys.setenv(TWILIO_TOKEN = "483H9lE05V0Jr362eq1814Li2N1I424t")
##D 
##D # Get messages sent to your account
##D messages <- tw_get_messages_list()
##D 
##D # Create data frame from log
##D sms_data <- tw_message_tbl(messages)
##D 
## End(Not run)



