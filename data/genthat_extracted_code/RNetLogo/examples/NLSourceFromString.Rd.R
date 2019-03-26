library(RNetLogo)


### Name: NLSourceFromString
### Title: Creates or appends NetLogo code from R.
### Aliases: NLSourceFromString
### Keywords: interface NLSourceFromString RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D setup <- "to setup\n ca\n crt 10\nend \n"
##D go <- "to go\n ask turtles [\n  set xcor random-xcor\n  
##D        set ycor random-ycor\n ]\nend \n"
##D reporter1 <- "to-report noturtles\n report count turtles\n end \n"
##D NLSourceFromString(setup,go,reporter1, append.model=FALSE)
##D NLCommand("setup")
##D NLCommand("go")
##D noturtles <- NLReport("noturtles")
##D print(noturtles)
## End(Not run)



