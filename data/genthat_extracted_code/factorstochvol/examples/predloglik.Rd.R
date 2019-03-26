library(factorstochvol)


### Name: predloglik
### Title: Evaluates the predictive log likelihood using the predicted
###   covariance matrix
### Aliases: predloglik

### ** Examples

## Not run: 
##D set.seed(1)
##D 
##D # Simulate a time series of length 1100:
##D sim <- fsvsim(n = 1100, series = 3, factors = 1)
##D y <- sim$y
##D 
##D # Estimate using only 1000 days:
##D res <- fsvsample(y[seq_len(1000),], factors = 1)
##D 
##D # Evaluate the 1, 10, and 100 days ahead predictive log
##D # likelihood:
##D ahead <- c(1, 10, 100)
##D scores <- predloglik(res, y[1000+ahead,], ahead = ahead, each = 10)
##D print(scores)
## End(Not run)




