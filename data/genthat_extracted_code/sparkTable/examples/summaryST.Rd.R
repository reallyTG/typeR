library(sparkTable)


### Name: summaryST
### Title: summaryST - data frame in a graphical table
### Aliases: summaryST summaryST-methods summaryST,data.frame-method

### ** Examples

## Not run: 
##D data1 <- data.frame(x=rnorm(100),y=rlnorm(100),
##D   z=rbeta(100,1,1))
##D #default summary table
##D summaryST(data1,filename="st1a",graphNames="out1a")
##D #changing the order of the columns
##D summaryST(data1,filename="st1b",changeOrder=c(6,7,2,3,1,4,5,8),graphNames="out1b")
##D #adding a custom column
##D summaryST(data1,filename="st1c",addFun=list(var=function(x)round(var(x,na.rm=TRUE),2)),
##D   graphNames="out1c")
##D 
##D data2 <- data.frame(x1=rnorm(100),x2=rnorm(100)+1,x3=rnorm(100)+5)
##D summaryST(data2,filename="st1d",graphNames="out1d",scaleHistByCol=TRUE,scaleBoxByCol=TRUE)
##D # the same results in a shiny app:
##D 
##D showSparkTable(data2)
## End(Not run)



