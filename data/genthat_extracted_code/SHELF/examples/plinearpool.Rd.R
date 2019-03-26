library(SHELF)


### Name: plinearpool
### Title: Calculate fitted probabilities or quantiles from a (weighted)
###   linear pool
### Aliases: plinearpool qlinearpool

### ** Examples

## Not run: 
##D # Expert 1 states P(X<30)=0.25, P(X<40)=0.5, P(X<50)=0.75
##D # Expert 2 states P(X<20)=0.25, P(X<25)=0.5, P(X<35)=0.75
##D # Both experts state 0<X<100.
##D 
##D v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
##D p <- c(0.25, 0.5, 0.75)
##D myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
##D 
##D plinearpool(myfit, x=c(20, 50, 80))
##D qlinearpool(myfit, q=c(0.05, 0.5, 0.95))
##D 
##D # give more weight to first expert
##D plinearpool(myfit, x=c(20, 50, 80), w=c(0.7, 0.3)) 
##D 
##D # force the use of gamma distributions for each expert
##D qlinearpool(myfit, q=c(0.05, 0.5, 0.95), d="gamma") 
## End(Not run)



