library(reportr)


### Name: reportr
### Title: The reportr message reporting system
### Aliases: reportr OL setOutputLevel getOutputLevel withReportrHandlers
###   ask report flag reportFlags clearFlags assert

### ** Examples

setOutputLevel(OL$Warning)
report(Info, "Test message")  # no output
setOutputLevel(OL$Info)
report(Info, "Test message")  # prints the message

flag(Warning, "Test warning")  # no output
flag(Warning, "Test warning")  # repeated warning
reportFlags()  # consolidates the warnings and prints the message

## Not run: 
##D name <- ask("What is your name?")
##D report(OL$Info, "Hello, #{name}")
## End(Not run)




