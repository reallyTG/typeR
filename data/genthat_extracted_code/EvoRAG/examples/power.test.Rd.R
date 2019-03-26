library(EvoRAG)


### Name: power.test
### Title: performs a simulation based analysis of statistical power
### Aliases: power.test
### Keywords: Simulation Statistical power Type II error

### ** Examples

## Not run: 
##D 
##D  ###simulate data
##D   set.seed(seed = 3)
##D   TIME = runif(n=300, min = 0, max = 10)
##D   GRAD = runif(n=300, min = 0, max = 60)
##D   DATA1 <- sim.sisters(TIME = TIME, GRAD=GRAD, parameters = c(2, -0.03), 
##D      model=c("BM_linear"))
##D 
##D   ###run power.test
##D   model = c("BM_linear")
##D   power.test(TIME=TIME, GRAD=GRAD, parameters = c(2, -0.03), test.model="BM_linear", 
##D      threshold_deltaAICc = c((1:20)*0.5), REP=1, N=2, write = "FALSE", wd = "")
##D  
## End(Not run)#end dontrun



