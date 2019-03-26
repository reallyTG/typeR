library(RNetLogo)


### Name: NLStart
### Title: Creates an instance of NetLogo
### Aliases: NLStart
### Keywords: interface NLStart RNetLogo

### ** Examples

## Not run: 
##D library(RNetLogo)
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D NLCommand("create-turtles 10")
##D noturtles <- NLReport("count turtles")
##D print(noturtles)
##D 
##D # create a second NetLogo instance in headless mode (= without GUI) 
##D # stored in a variable
##D nlheadless1 <- "nlheadless1"
##D NLStart(nl.path, gui=F, nl.obj=nlheadless1)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""), nl.obj=nlheadless1)
##D NLCommand("setup", nl.obj=nlheadless1)
##D burned1 <- NLDoReport(20, "go", c("ticks","burned-trees"), 
##D                       as.data.frame=TRUE,df.col.names=c("tick","burned"), 
##D                       nl.obj=nlheadless1)
##D print(burned1)
##D 
##D # create a third NetLogo instance in headless mode (= without GUI) 
##D # with explicit name of stored object
##D nlheadless2 <- "nlheadless2"
##D NLStart(nl.path, gui=F, nl.obj=nlheadless2)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""), nl.obj=nlheadless2)
##D NLCommand("setup", nl.obj=nlheadless2)
##D burned2 <- NLDoReport(10, "go", c("ticks","burned-trees"), 
##D                       as.data.frame=TRUE,df.col.names=c("tick","burned"), 
##D                       nl.obj=nlheadless2)
##D print(burned2)               
## End(Not run)



