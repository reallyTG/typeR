library(Causata)


### Name: Config.CreatePrimaryVariable
### Title: Defines a Causata primary variable.
### Aliases: Config.CreatePrimaryVariable

### ** Examples

# The settings below are not for an actual server, 
# they are for illustration purposes only.
causata.config <- CausataConfig("server.causata.com","8002",
  "causatauser","Bg20qydd6*")

# the command below is commented out since it requires a live server to run
#result <- Config.CreatePrimaryVariable(causata.config, 
#  variable.name="online-has-page-view", 
#  variable.display.name="Online: Has Page View", 
#  variable.expression="INCLUDES page-view")



