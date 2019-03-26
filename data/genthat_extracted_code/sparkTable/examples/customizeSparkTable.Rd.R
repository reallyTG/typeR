library(sparkTable)


### Name: customizeSparkTable
### Title: Customize a sparkTable within a shiny App
### Aliases: customizeSparkTable

### ** Examples

## Not run: 
##D data(pop,package="sparkTable")
##D b <- newSparkBox()
##D l <- newSparkLine()
##D bb <- newSparkBar()
##D content <- list(
##D   function(x) { round(mean(x),2) },
##D   b,
##D   l,
##D   bb,
##D   function(x) { round(tail(x,1),2) }
##D )
##D names(content) <- paste("column",1:length(content),sep="")
##D varType <- rep("value",length(content))
##D pop <- pop[,c("variable","value","time")]
##D pop$time <- as.numeric(as.character(pop$time))
##D xx <- reshapeExt(pop, varying=list(2))
##D x1 <- newSparkTable(xx, content, varType)
##D x1@dataObj$v1 <- rpois(nrow(xx),1)
##D x1@dataObj$v2 <- rpois(nrow(xx),2)
##D x1@dataObj$v3 <- rpois(nrow(xx),3)
##D 
##D customizeSparkTable(x1, outputDir=getwd())
## End(Not run)



