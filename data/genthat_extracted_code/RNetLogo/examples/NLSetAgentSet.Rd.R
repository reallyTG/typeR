library(RNetLogo)


### Name: NLSetAgentSet
### Title: Sets a variable of one or more agent(s) to value(s) in a
###   data.frame or vector.
### Aliases: NLSetAgentSet
### Keywords: interface NLSetAgentSet RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D # NLLoadModel(...)
##D ag <- NLGetAgentSet(c("xcor","ycor"),"turtles")
##D ag2 <- data.frame(xcor=ag$xcor, ycor=ag$xcor)
##D NLSetAgentSet("turtles", ag2)
## End(Not run)



