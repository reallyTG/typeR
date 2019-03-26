library(DoE.MIParray)


### Name: DoE.MIParray-package
### Title: Package to Create a MIP Based Array
### Aliases: DoE.MIParray
### Keywords: array design

### ** Examples

## Not run: 
##D ## ideal sequence of optimization problems
##D ## shown here for Mosek,
##D ## for Gurobi analogous, if necessary increasing maxtime to e.g. 600 or 3600 or ...
##D 
##D ## very small problem
##D plan <- mosek_MIParray(16, rep(2,6), resolution=4, kmax=6)
##D 
##D ## an example approach for a larger problem
##D ## optimize shortest word length
##D plan3 <- mosek_MIParray(24, c(2,4,3,2,2,2,2), resolution=3, maxtime=20)
##D ## feasible solution was found, no confirmed optimum, 7/3 words of length 3
##D ## try to optimize further or confirm optimality (improve=TRUE does this),
##D ##                      give it 10 minutes
##D plan3b <- mosek_MIPcontinue(plan3, improve=TRUE, maxtime=600)
##D ##     no improvement has been found, and the gap is still very large
##D ##     (the time limit makes the result non-deterministic, of course,
##D ##      because it depends on the computer's power and availability of its resources)
##D 
##D ## For large problems, it cannot be expected that a *confirmed* optimum is found.
##D ## Of course, one can put more effort into the optimization, e.g. by running overnight.
##D ## It is also advisable to compare the outcome to other ways for obtaining a good array,
##D ##    e.g. function oa.design from package DoE.base with optimized column allocation.
##D require(DoE.base)
##D show.oas(nruns=24, nlevels=c(2,4,3,2,2,2,2), show=Inf)
##D GWLP(plan_oad <- oa.design(nruns=24, nlevels=c(2,4,3,2,2,2,2), col="min34"))
##D ## here, plan3b has a better A3 than plan_oad
##D 
##D ## one might also try to confirm optimality by switching to the other optimizer
##D plan3c <- gurobi_MIPcontinue(plan3b, improve=TRUE, maxtime=600, MIPFocus=3)
##D    ## focus on improved bound with option MIPFocus
##D    ## still same value with very large gap after running this
##D    ## thus, now assume this as best practically feasible value
##D 
##D ## one might now try to improve words of length 4 (improve=FALSE turns to the next word length)
##D plan4 <- mosek_MIPcontinue(plan3b, improve=FALSE, maxtime=600)
##D    ## this does not yield any improvement
##D    ## working on longer words is not considered worthwhile
##D    ## thus, plan3 or plan3b are used for pragmatic reasons,
##D    ## without confirmed optimality
## End(Not run)



