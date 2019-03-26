library(pscl)


### Name: ideal
### Title: analysis of educational testing data and roll call data with IRT
###   models, via Markov chain Monte Carlo methods
### Aliases: ideal
### Keywords: models

### ** Examples

## Not run: 
##D ## long run, many iterations
##D data(s109)
##D n <- dim(s109$legis.data)[1]
##D x0 <- rep(0,n)
##D x0[s109$legis.data$party=="D"] <- -1
##D x0[s109$legis.data$party=="R"] <- 1
##D 
##D id1 <- ideal(s109,
##D              d=1,
##D              startvals=list(x=x0),
##D              normalize=TRUE,
##D              store.item=TRUE,
##D              maxiter=260E3,
##D              burnin=10E3,
##D              thin=100)  
## End(Not run)



