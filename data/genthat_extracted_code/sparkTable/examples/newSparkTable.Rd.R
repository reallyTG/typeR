library(sparkTable)


### Name: newSparkTable
### Title: Function to create new SparkTable object
### Aliases: newSparkTable

### ** Examples

  ## Not run: 
##D   ##Soccer
##D   data(AT_Soccer,package="sparkTable")
##D   content <- list(
##D     function(x) {sum(x)},
##D     function(x) { round(sum(x),2) },
##D     function(x) { round(sum(x),2) },
##D     newSparkLine(), newSparkBar()
##D   )
##D   names(content) <- c("Points","ShotGoal","GetGoal","GoalDiff","WinLose")
##D   varType <- c("points","shotgoal","getgoal","goaldiff","wl")
##D   x1 <- newSparkTable(AT_Soccer, content, varType)
##D   showSparkTable(x1)
##D   export(x1,outputType="html")
##D         
##D         
##D   #Population
##D   data(pop)
##D   b <- newSparkBox()
##D   l <- newSparkLine()
##D   bb <- newSparkBar()
##D   content <- list(function(x) { round(mean(x),2) },
##D     b,l,bb,
##D     function(x) { round(tail(x,1),2) })
##D   names(content) <- paste("column",1:5,sep="")
##D   varType <- rep("value",5)
##D   pop <- pop[,c("variable","value","time")]
##D   pop$time <- as.numeric(as.character(pop$time))
##D   xx <- reshapeExt(pop, varying=list(2))
##D   x1 <- newSparkTable(xx, content, varType)
##D   export(x1, outputType="html", graphNames="out1")
##D   
## End(Not run)



