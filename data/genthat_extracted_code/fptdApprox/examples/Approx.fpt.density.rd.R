library(fptdApprox)


### Name: Approx.fpt.density
### Title: Approximating First-Passage-Time Densities
### Aliases: Approx.fpt.density
### Keywords: classes list methods print

### ** Examples

## Continuing the diffproc(.) example:
## Don't show: 
Lognormal <- diffproc(c("m*x","sigma^2*x^2","dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),sigma*sqrt(t-s))"))
## End(Don't show)
## Making an efficient approximation of the f.p.t. density
## in the case of a conditioned f.p.t. problem. (optimal 
## variable integration steps and small computational cost)
yyy.cp <- Approx.fpt.density(dp = Lognormal, t0 = 0, T = 18, id = 1, S = 
                        "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))", 
                        env = list(m = 0.48, sigma = 0.07))
yyy.cp

## Not run: 
##D ## Making a less efficient approximation of the f.p.t. density 
##D ## (optimal fixed integration step but high computational cost related to 
##D ##  the efficient approximation)
##D yyy1.cp <- Approx.fpt.density(dp = Lognormal, t0 = 0, T = 18, id = 1, S = 
##D                         "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))", 
##D                         env = list(m = 0.48, sigma = 0.07), 
##D                         variableStep = FALSE, from.t0 = TRUE, to.T = 
##D                         TRUE, skip = FALSE)
##D yyy1.cp
##D 
##D ## Making an efficient approximation of the f.p.t. density 
##D ## in the case of an unconditioned f.p.t. problem.
##D yyy.ucp <- Approx.fpt.density(dp = Lognormal, t0 = 0, T = 18, id = 
##D                 list("dlnorm(x,-0.005,0.1)", "Lambda(-0.005,0.1)", 
##D                 "\\Lambda(-0.005,0.1)", "Lognormal(-0.005,0.1)"),
##D                 S = "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))", 
##D                 env = list(m = 0.48, sigma = 0.07), m=25)                 
##D yyy.ucp
## End(Not run)



