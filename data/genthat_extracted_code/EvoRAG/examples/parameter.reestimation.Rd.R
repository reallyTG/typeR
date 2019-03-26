library(EvoRAG)


### Name: parameter.reestimation
### Title: uses simulation to determine robustness of parameter estimates
###   under a model
### Aliases: parameter.reestimation
### Keywords: Simulation parameter re-estimation

### ** Examples

## Not run: 
##D   ###simulate data
##D   set.seed(seed = 3)
##D   TIME = runif(n=300, min = 0, max = 10)
##D   GRAD = runif(n=300, min = 0, max = 60)
##D   DATA1 <- sim.sisters(TIME = TIME, GRAD=GRAD, parameters = c(2, -0.03), 
##D      model=c("BM_linear"))
##D 
##D   ###run parameter.reestimation
##D   model = c("BM_linear")
##D   parameter.reestimation(GRAD, TIME, model=model, PARAMETERS=c(2, -0.03), 
##D      N=100, REP = 1)
##D  
## End(Not run)#end dontrun



