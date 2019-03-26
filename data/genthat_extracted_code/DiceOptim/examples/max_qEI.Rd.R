library(DiceOptim)


### Name: max_qEI
### Title: Maximization of multipoint expected improvement criterion (qEI)
### Aliases: max_qEI
### Keywords: optimize

### ** Examples

## Not run: 
##D 
##D set.seed(000)
##D # 3-points EI maximization.
##D # 9-points factorial design, and the corresponding response
##D d <- 2
##D n <- 9
##D design.fact <- expand.grid(seq(0,1,length=3), seq(0,1,length=3))
##D names(design.fact)<-c("x1", "x2")
##D design.fact <- data.frame(design.fact)
##D names(design.fact)<-c("x1", "x2")
##D response.branin <- apply(design.fact, 1, branin)
##D response.branin <- data.frame(response.branin)
##D names(response.branin) <- "y"
##D lower <- c(0,0)
##D upper <- c(1,1)
##D 
##D # number of point in the bacth
##D batchSize <- 3
##D 
##D # model identification
##D fitted.model <- km(~1, design=design.fact, response=response.branin,
##D                    covtype="gauss", control=list(pop.size=50,trace=FALSE), parinit=c(0.5, 0.5))
##D 
##D # maximization of qEI
##D 
##D # With a multistarted BFGS algorithm
##D maxBFGS <- max_qEI(model = fitted.model, npoints = batchSize, lower = lower, upper = upper,
##D crit = "exact",optimcontrol=list(nStarts=3,method = "BFGS"))
##D # With a genetic algorithme using derivatives
##D maxGen  <- max_qEI(model = fitted.model, npoints = batchSize, lower = lower, upper = upper,
##D crit = "exact", optimcontrol=list(nStarts=3,method = "genoud",pop.size=100,max.generations = 15))
##D # With the constant liar heuristic
##D maxCL   <- max_qEI(model = fitted.model, npoints = batchSize, lower = lower, upper = upper,
##D crit = "CL",optimcontrol=list(pop.size=20))
##D 
##D # comparison
##D print(maxBFGS$value)
##D print(maxGen$value)
##D print(maxCL$value)
##D 
## End(Not run)



