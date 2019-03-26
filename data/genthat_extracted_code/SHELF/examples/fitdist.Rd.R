library(SHELF)


### Name: fitdist
### Title: Fit distributions to elicited probabilities
### Aliases: fitdist

### ** Examples

## Not run: 
##D # One expert, with elicited probabilities
##D # P(X<20)=0.25, P(X<30)=0.5, P(X<50)=0.75
##D # and X>0.
##D v <- c(20,30,50)
##D p <- c(0.25,0.5,0.75)
##D fitdist(vals=v, probs=p, lower=0)
##D 
##D # Now add a second expert, with elicited probabilities
##D # P(X<55)=0.25, P(X<60=0.5), P(X<70)=0.75
##D v <- matrix(c(20,30,50,55,60,70),3,2)
##D p <- c(0.25,0.5,0.75)
##D fitdist(vals=v, probs=p, lower=0)
##D 
##D # Two experts, different elicited quantiles and limits.
##D # Expert A: P(X<50)=0.25, P(X<60=0.5), P(X<65)=0.75, and provides bounds 10<X<100
##D # Expert B: P(X<40)=0.33, P(X<50=0.5), P(X<60)=0.66, and provides bounds 0<X
##D v <- matrix(c(50,60,65,40,50,60),3,2)
##D p <- matrix(c(.25,.5,.75,.33,.5,.66),3,2)
##D l <- c(10,0)
##D u <- c(100, Inf)
##D fitdist(vals=v, probs=p, lower=l, upper=u)
## End(Not run)



