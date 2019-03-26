library(sparkTable)


### Name: showSparkTable-methods
### Title: Look at your sparkTable in a shiny App
### Aliases: showSparkTable showSparkTable-methods
###   showSparkTable,sparkTable-method showSparkTable,data.frame-method

### ** Examples

## Not run: 
##D data(pop,package="sparkTable")
##D b <- newSparkBox()
##D l <- newSparkLine()
##D bb <- newSparkBar()
##D content <- list(function(x) { round(mean(x),2) },
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
##D showSparkTable(x1)
##D 
##D #Example Hist+Box with 2 variables in 10 different groups
##D datEx <- data.frame(
##D   variable=sample(paste("Cat",1:10,sep="_"),1000,replace=TRUE),
##D   value=rnorm(1000),value2=rlnorm(1000)
##D )
##D b <- newSparkBox()
##D h <- newSparkHist()
##D content <- list(
##D   function(x) { round(mean(x),2) },
##D   function(x) { round(median(x),2) },
##D   function(x) { round(quantile(x,.25),2) },
##D   function(x) { round(quantile(x,.75),2) },
##D   b,
##D   h,
##D   function(x) { round(mean(x),2) },
##D   function(x) { round(median(x),2) },
##D   function(x) { round(quantile(x,.25),2) },
##D   function(x) { round(quantile(x,.75),2) },
##D   b,
##D   h
##D )
##D names(content) <- c(
##D   paste(c("Mean","Median","Q25","Q75","Boxplot","Histogram"),"_v1",sep=""),
##D   paste(c("Mean","Median","Q25","Q75","Boxplot","Histogram"),"_v2",sep="")
##D )
##D varType <- c(rep("value",length(content)/2),rep("value2",length(content)/2))
##D datEx <- reshapeExt(datEx, varying=list(2,3))
##D x2 <- newSparkTable(datEx, content, varType)
##D showSparkTable(x2)
##D 
##D #Example for the data.frame method (uses summaryST)
##D data2 <- data.frame(x1=rnorm(100),x2=rnorm(100)+1,x3=rnorm(100)+5)
##D showSparkTable(data2)
## End(Not run)



