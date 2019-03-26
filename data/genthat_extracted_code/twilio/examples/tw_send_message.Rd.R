library(twilio)


### Name: tw_send_message
### Title: Send an SMS or MMS Message
### Aliases: tw_send_message

### ** Examples

## Not run: 
##D 
##D # Set API credentials
##D # You only need to do this once per R session
##D Sys.setenv(TWILIO_SID = "M9W4Ozq8BFX94w5St5hikg7UV0lPpH8e56")
##D Sys.setenv(TWILIO_TOKEN = "483H9lE05V0Jr362eq1814Li2N1I424t")
##D 
##D # Send a simple text message
##D tw_send_message("2125557634", "9178675903", "Hello from R!")
##D 
##D # Send a picture message
##D tw_send_message("2125557634", "9178675903", media_url = "https://www.r-project.org/logo/Rlogo.png")
##D 
##D # Send a picture message with text
##D tw_send_message("2125557634", "9178675903", "Do you like the new logo?",
##D     "https://www.r-project.org/logo/Rlogo.png")
##D 
## End(Not run)



