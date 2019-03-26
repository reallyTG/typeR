library(RNetLogo)


### Name: NLGetAgentSet
### Title: Reports variable value(s) of one or more agent(s) as a
###   data.frame (optional as a list or vector)
### Aliases: NLGetAgentSet
### Keywords: interface NLGetAgentSet RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D # NLLoadModel(...)
##D NLCommand("create-turtles 10")
##D 
##D colors <- NLGetAgentSet(c("who","xcor","ycor","color"), 
##D                         "turtles with [who < 5]")
##D str(colors)
##D                         
##D # or as a list (slightly faster):
##D colors.list <- NLGetAgentSet(c("who","xcor","ycor","color"), 
##D                         "turtles with [who < 5]", as.data.frame=FALSE)
##D str(colors.list)
##D             
##D # or as a list with one list element for each agent
##D # (very slow!, not recommended especially for large agentsets)
##D colors.list2 <- NLGetAgentSet(c("who","xcor","ycor","color"), 
##D                         "turtles with [who < 5]", as.data.frame=FALSE, 
##D                         agents.by.row=TRUE)
##D str(colors.list2)
##D                         
##D # getting the ends of links is a little bit more tricky, because they store only the
##D # reference to the turtles and turtles cannot directly be requested. 
##D # A way to go is:
##D # create some links
##D NLCommand("ask turtles [ create-links-with n-of 2 other turtles ]")
##D link.test <- NLGetAgentSet(c("[who] of end1","[who] of end2"),"links")
##D str(link.test)
## End(Not run)



