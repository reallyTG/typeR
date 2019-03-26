library(pso)


### Name: pso-package
### Title: A Particle Swarm Optimizer
### Aliases: pso-package pso
### Keywords: package optimize

### ** Examples

## Not run: 
##D ## Some examples of using the functions in the package
##D 
##D ## Using basic "optim" interface to minimize a function
##D set.seed(1)
##D psoptim(rep(NA,2),function(x) 20+sum(x^2-10*cos(2*pi*x)),
##D         lower=-5,upper=5,control=list(abstol=1e-8))
##D 
##D ## Parabola
##D p <- test.problem("parabola",10) # one local=global minimum
##D set.seed(1)
##D o1 <- psoptim(p,control=list(trace=1,REPORT=50))
##D show(o1)
##D 
##D set.seed(1)
##D o2 <- psoptim(p,control=list(trace=1,REPORT=50,w=c(.7,.1))) 
##D show(o2)
##D 
##D set.seed(1)
##D o3 <- psoptim(p,control=list(trace=1,REPORT=1,hybrid=TRUE)) 
##D show(o3) ## hybrid much faster
##D 
##D ## Griewank
##D set.seed(2)
##D p <- test.problem("griewank",10) # lots of local minima
##D o1 <- psoptim(p,control=list(trace=1,REPORT=50))
##D show(o1)
##D 
##D ## The above sometimes get stuck in a local minima.
##D ## Adding a restart to increase robustness.
##D set.seed(2)
##D o2 <- psoptim(p,control=list(trace=1,REPORT=50,reltol=1e-4))
##D show(o2)
##D 
##D ## An then adding the hybrid
##D set.seed(2)
##D o3 <- psoptim(p,control=list(trace=1,REPORT=50,reltol=1e-4,
##D               hybrid=TRUE,hybrid.control=list(maxit=10)))
##D show(o3)
##D 
##D ## Rosenbrock
##D set.seed(1)
##D p <- test.problem("rosenbrock",1)
##D o1 <- psoptim(p,control=list(trace=1,REPORT=50))
##D show(o1)
##D 
##D ## Change to fully informed
##D set.seed(1)
##D o2 <- psoptim(p,control=list(trace=1,REPORT=50,p=1))
##D show(o2)
##D 
##D ## Rastrigin
##D p <- test.problem("rastrigin",10)
##D set.seed(1)
##D o1 <- psoptim(p,control=list(trace=1,REPORT=50))
##D show(o1)
##D 
##D set.seed(1)
##D o2 <- psoptim(p,control=list(trace=1,REPORT=50,hybrid=TRUE,
##D               hybrid.control=list(maxit=10)))
##D show(o2) # better
##D plot(o1,xlim=c(0,p@maxf),ylim=c(0,100))
##D lines(o2,col=2) # and much faster convergence
##D 
##D ## Ackley
##D set.seed(1)
##D p <- test.problem("ackley",10)
##D o1 <- psoptim(p,control=list(trace=1,REPORT=50))
##D show(o1)
## End(Not run)


