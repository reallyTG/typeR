library(spatstat.local)


### Name: psib.loccit
### Title: Sibling Probability of Locally Fitted Cluster Point Process
### Aliases: psib.loccit psib.locmincon
### Keywords: spatial models

### ** Examples

   ## Not run: 
##D    fit <- loccit(redwood, ~1, "Thomas")
##D    
## End(Not run)
   ## Don't show: 
   X <- redwood[owin(c(0,1), c(-1,-1/2))]
   fit <- loccit(X, ~1, "Thomas", nd=5, control=list(maxit=20))
   
## End(Don't show)
   fit
   plot(psib(fit))



