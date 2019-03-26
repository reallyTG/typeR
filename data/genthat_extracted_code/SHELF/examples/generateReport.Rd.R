library(SHELF)


### Name: generateReport
### Title: Generate a report to show the fitted distributions
### Aliases: generateReport

### ** Examples

## Not run: 
##D # One expert, with elicited probabilities
##D # P(X<20)=0.25, P(X<30)=0.5, P(X<50)=0.75
##D # and X>0.
##D v <- c(20,30,50)
##D p <- c(0.25,0.5,0.75)
##D myfit <- fitdist(vals=v, probs=p, lower=0)
##D 
##D generateReport(myfit)
## End(Not run)



