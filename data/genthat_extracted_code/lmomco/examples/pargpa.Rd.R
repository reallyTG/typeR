library(lmomco)


### Name: pargpa
### Title: Estimate the Parameters of the Generalized Pareto Distribution
### Aliases: pargpa
### Keywords: distribution (parameters) Distribution: Generalized Pareto

### ** Examples

X   <- rexp(200)
lmr <- lmoms(X)
P1  <- pargpa(lmr)
P2  <- pargpa(lmr, xi=0.25)

## Not run: 
##D F <- nonexceeds()
##D plot(pp(X), sort(X))
##D lines(F,quagpa(F,P1))  # black line
##D lines(F, quagpa(F,P2), col=2)   # red line
## End(Not run)



