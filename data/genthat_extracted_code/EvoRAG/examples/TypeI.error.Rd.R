library(EvoRAG)


### Name: TypeI.error
### Title: performs a simulation based analysis of type I error
### Aliases: TypeI.error
### Keywords: Simulation delta AICc Type I error

### ** Examples

## Not run: 
##D 
##D  ###simulate data
##D   set.seed(seed = 3)
##D   TIME = runif(n=300, min = 0, max = 10)
##D   GRAD = runif(n=300, min = 0, max = 60)
##D   DATA1 <- sim.sisters(TIME = TIME, GRAD=GRAD, parameters = c(2), model=c("BM_null"))
##D 
##D   ###run typeI error test. This should be run for a minimum of N=1000 simulations
##D   TypeI.error(TIME, GRAD, beta=2, null.model="BM_null", REP=1, N=10, 
##D      write.file = "FALSE", wd = "")
##D  
## End(Not run)#end dontrun



