library(Rmalschains)


### Name: Rmalschains-package
### Title: Getting started with the Rmalschains package
### Aliases: Rmalschains Rmalschains-package
### Keywords: MA-LS-Chains optimization,

### ** Examples


##############################################
#Example for maximization of the claw function
##############################################

claw <- function(xx) {
  x <- xx[1]
  y <- (0.46 * (dnorm(x, -1, 2/3) + dnorm(x, 1, 2/3)) +
        (1/300) * (dnorm(x, -0.5, 0.01) + dnorm(x, -1,
              0.01) + dnorm(x, -1.5, 0.01)) + (7/300) *
        (dnorm(x, 0.5, 0.07) + dnorm(x, 1, 0.07) + dnorm(x,
              1.5, 0.07)))
  return(y)
}

#use MA-CMA-Chains
res.claw <- malschains(function(x) {-claw(x)}, lower=c(-3), upper=c(3), 
                       maxEvals=50000, control=malschains.control(popsize=50, 
                       istep=300, ls="cmaes", optimum=-5))

## Not run: 
##D #use only the CMA-ES local search               
##D res.claw2 <- malschains(function(x) {-claw(x)}, lower=c(-3), upper=c(3), verbosity=0,
##D                        maxEvals=50000, control=malschains.control(ls="cmaes", 
##D                            lsOnly=TRUE, optimum=-5))
##D 
##D #use only the Simplex local search               
##D res.claw3 <- malschains(function(x) {-claw(x)}, lower=c(-3), upper=c(3), verbosity=0,
##D                        maxEvals=50000, control=malschains.control(ls="simplex", 
##D                            lsOnly=TRUE, optimum=-5))
##D                     
##D x <- seq(-3, 3,length=1000)
##D claw_x <- NULL
##D for (i in 1:length(x)) claw_x[i] <- claw(x[i])
##D 
##D plot(x,claw_x, type="l")
##D points(res.claw$sol, -res.claw$fitness, col="red")
##D points(res.claw2$sol, pch=3, -res.claw2$fitness, col="blue")
##D points(res.claw3$sol, pch=3, -res.claw3$fitness, col="green")
##D 
##D 
##D ##############################################
##D #Example for the rastrigin function
##D ##############################################
##D  
##D rastrigin <- function(x) {
##D   
##D   dimension <- length(x)
##D   
##D   res <- 0.0
##D   for (i in 1:dimension) {
##D     res <- res + (x[i]*x[i] - 10.0*cos(2.0*pi*x[i]) + 10.0)
##D   }
##D 
##D   res 
##D }
##D 
##D res.rastrigin1 <- malschains(rastrigin, lower=seq(-1.0, -1.0, length=30), 
##D                              upper=seq(1.0, 1.0, length=30), maxEvals=50000, 
##D                              control=malschains.control(effort=0.8, alpha=0.3, 
##D                              popsize=20, istep=100, ls="simplex"))
##D 
##D 
##D res.rastrigin2 <- malschains(rastrigin, lower=seq(-1.0, -1.0, length=30), 
##D                              upper=seq(1.0, 1.0, length=30), maxEvals=50000, 
##D                              initialpop = seq(0.1, 0.1, length=30), 
##D                              control=malschains.control(popsize=50, 
##D                              istep=300, ls="cmaes"))
##D 
##D res.rastrigin1
##D res.rastrigin2
## End(Not run)



