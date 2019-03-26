library(partools)


### Name: dbs
### Title: Debugging aid for 'parallel' cluster code.
### Aliases: dbs writemgrscreen writewrkrscreens killdebug dbsmsg dbsdump
###   dbsmsgstart

### ** Examples

## Not run: 
##D # quick-and-dirty method
##D cls <- makeCluster(2) 
##D setclsinfo(cls)
##D # define 'buggy' function
##D g <- function(x,y) {u<-x+y; v<-x-y; dbsmsg(c(u,v)); u^2+v^2} 
##D clusterExport(cls,"g") 
##D # set x and y at cluster nodes
##D clusterEvalQ(cls,{x <- runif(1); y <- runif(1)}) 
##D # start debugging session
##D dbsmsgstart(cls) 
##D # run
##D clusterEvalQ(cls,g(x,y)) 
##D # files dbs.1 and dbs.2 created, each reporting u,v values
##D 
##D # dbs() method
##D # make a test file
##D cat(c("f <- function(x) {","   x <- x + 1","   x^2","}"),file="x.R",sep="\n")
##D dbs(2,src="x.R",ftn="f")
##D # now type in manager window:
##D clusterEvalQ(cls,f(5))
##D # the 2 worker windows are now in the browser, ready for debugging
##D 
##D stopCluster(cls)
## End(Not run)



