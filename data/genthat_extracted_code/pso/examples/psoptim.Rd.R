library(pso)


### Name: psoptim
### Title: Particle Swarm Optimizer
### Aliases: psoptim
### Keywords: optimize

### ** Examples

set.seed(1)
## Rastrigin function
psoptim(rep(NA,2),function(x) 20+sum(x^2-10*cos(2*pi*x)),
        lower=-5,upper=5,control=list(abstol=1e-8))

set.seed(1)
## Rastrigin function - local refinement with L-BFGS-B on improvements
psoptim(rep(NA,2),function(x) 20+sum(x^2-10*cos(2*pi*x)),
        lower=-5,upper=5,control=list(abstol=1e-8,hybrid="improved"))

## Griewank function
psoptim(rep(NA,2),function(x) sum(x*x)/4000-prod(cos(x/sqrt(1:2)))+1,
        lower=-100,upper=100,control=list(abstol=1e-2))

set.seed(1)
## Rastrigin function with reporting
o <- psoptim(rep(NA,2),function(x) 20+sum(x^2-10*cos(2*pi*x)),
             lower=-5,upper=5,control=list(abstol=1e-8,trace=1,REPORT=1,
             trace.stats=TRUE))
## Not run: 
##D plot(o$stats$it,o$stats$error,log="y",xlab="It",ylab="Error")
##D points(o$stats$it,sapply(o$stats$f,min),col="blue",pch=2)
## End(Not run)



