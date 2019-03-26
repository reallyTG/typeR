library(SHELF)


### Name: feedback
### Title: Report quantiles and probabilities from the fitted probability
###   distributions
### Aliases: feedback

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
##D 
##D feedback(myfit)
##D 
##D # Feedback P(X<60) and the tertiles
##D feedback(myfit, values=60, quantiles=c(0.33,0.66))
##D 
##D # Compare fitted tertiles for different distributions, expert 2 only
##D feedback(myfit, quantiles=c(0.33,0.66), ex=2)
## End(Not run)




