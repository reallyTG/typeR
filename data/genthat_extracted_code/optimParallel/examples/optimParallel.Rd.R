library(optimParallel)


### Name: optimParallel
### Title: parallel version of 'optim'
### Aliases: optimParallel optimparallel optimParallel-package
###   optimParallel-Package OptimParallel-package OptimParallel-Package
###   optimparallel-package optimparallel-Package optimParallel-package
### Keywords: package

### ** Examples

negll <- function(par, x, sleep=0, verbose=TRUE){
    if(verbose)
        cat(par, "\n")
   Sys.sleep(sleep)
   -sum(dnorm(x=x, mean=par[1], sd=par[2], log=TRUE))
}
set.seed(13); x <- rnorm(1000, 5, 2)

cl <- makeCluster(2)     # set the number of processor cores
setDefaultCluster(cl=cl) # set 'cl' as default cluster

optimParallel(par=c(1,1), fn=negll, x=x,
              method = "L-BFGS-B", lower=c(-Inf, .0001))

optimParallel(par=c(1,1), fn=negll, x=x,
              method = "L-BFGS-B", lower=c(-Inf, .0001),
              parallel=list(loginfo=TRUE))

setDefaultCluster(cl=NULL); stopCluster(cl)

## default values of the argument 'parallel':
options("optimParallel.forward", "optimParallel.loginfo")

## Not run: 
##D ## - use all avilable processor cores
##D ## - return cat() output to R prompt
##D ##   (may have issues on Windows)
##D if(tolower(.Platform$OS.type) != "windows"){
##D     cl <- makeCluster(spec=detectCores(), type="FORK", outfile="")  
##D } else
##D     cl <- makeCluster(spec=detectCores(), outfile="")
##D setDefaultCluster(cl=cl)
##D 
##D ## return log information
##D options(optimParallel.loginfo=TRUE)              
##D 
##D ## stop if change of f(x) is smaller than 0.01
##D control <- list(factr=.01/.Machine$double.eps)
##D 
##D optimParallel(par=c(1,1), fn=negll, x=x, sleep=.5,
##D               verbose=TRUE, method="L-BFGS-B",
##D               lower=c(-Inf, .0001), control=control)
##D ## each step invokes 5 parallel calls to negll()
##D 
##D optimParallel(par=c(1,1), fn=negll, x=x, sleep=.5,
##D               method ="L-BFGS-B", lower=c(-Inf, .0001),
##D               control=control,
##D               parallel=list(forward=TRUE))
##D ## each step invokes 3 parallel calls to negll()
##D 
##D setDefaultCluster(cl=NULL); stopCluster(cl) 
## End(Not run)



