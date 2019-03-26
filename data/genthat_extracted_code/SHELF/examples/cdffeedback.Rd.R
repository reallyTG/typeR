library(SHELF)


### Name: cdffeedback
### Title: Feedback for the elicited distribution of the population CDF
### Aliases: cdffeedback

### ** Examples

## Not run: 
##D prfit <- fitprecision(interval = c(60, 70), propvals = c(0.2, 0.4), trans = "log")
##D medianfit <- fitdist(vals = c(50, 60, 70), probs = c(0.05, 0.5,  0.95), lower = 0)
##D cdffeedback(medianfit, prfit, quantiles = c(0.01, 0.99),
##D             vals = c(65, 75), alpha = 0.05, n.rep = 10000)
##D  
## End(Not run)  



