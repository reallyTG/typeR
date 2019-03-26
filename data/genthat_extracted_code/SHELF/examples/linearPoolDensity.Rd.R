library(SHELF)


### Name: linearPoolDensity
### Title: Obtain points on the density function of a linear pool
### Aliases: linearPoolDensity

### ** Examples


## Not run: 
##D # Two experts
##D # Expert 1 states P(X<30)=0.25, P(X<40)=0.5, P(X<50)=0.75
##D # Expert 2 states P(X<20)=0.25, P(X<25)=0.5, P(X<35)=0.75
##D # Both experts state 0<X<100. 
##D 
##D v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
##D p <- c(0.25, 0.5, 0.75)
##D myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
##D linearPoolDensity(myfit)
## End(Not run)



