library(sirt)


### Name: dirichlet.simul
### Title: Simulation of a Dirichlet Distributed Vectors
### Aliases: dirichlet.simul
### Keywords: Dirichlet distribution

### ** Examples

#############################################################################
# EXAMPLE 1: Simulation with two components
#############################################################################

set.seed(789)
N <- 2000
probs <- c(.7, .3)    # define (extremal) class probabilities

#*** alpha0=.2  -> nearly crisp latent classes
alpha0 <- .2
alpha <- alpha0*probs
alpha <- matrix( alpha, nrow=N, ncol=length(alpha), byrow=TRUE  )
x <- sirt::dirichlet.simul( alpha )
htitle <- expression(paste( alpha[0], "=.2, ", p[1], "=.7"   ) )
hist( x[,1], breaks=seq(0,1,len=20), main=htitle)

#*** alpha0=3 -> strong deviation from crisp membership
alpha0 <- 3
alpha <- alpha0*probs
alpha <- matrix( alpha, nrow=N, ncol=length(alpha), byrow=TRUE  )
x <- sirt::dirichlet.simul( alpha )
htitle <- expression(paste( alpha[0], "=3, ", p[1], "=.7"   ) )
hist( x[,1], breaks=seq(0,1,len=20), main=htitle)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Simulation with three components
##D #############################################################################
##D 
##D set.seed(986)
##D N <- 2000
##D probs <- c( .5, .35, .15 )
##D 
##D #*** alpha0=.2
##D alpha0 <- .2
##D alpha <- alpha0*probs
##D alpha <- matrix( alpha, nrow=N, ncol=length(alpha), byrow=TRUE  )
##D x <- sirt::dirichlet.simul( alpha )
##D htitle <- expression(paste( alpha[0], "=.2, ", p[1], "=.7"   ) )
##D miceadds::library_install("ade4")
##D ade4::triangle.plot(x, label=NULL, clabel=1)
##D 
##D #*** alpha0=3
##D alpha0 <- 3
##D alpha <- alpha0*probs
##D alpha <- matrix( alpha, nrow=N, ncol=length(alpha), byrow=TRUE  )
##D x <- sirt::dirichlet.simul( alpha )
##D htitle <- expression(paste( alpha[0], "=3, ", p[1], "=.7"   ) )
##D ade4::triangle.plot(x, label=NULL, clabel=1)
## End(Not run)



