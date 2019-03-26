library(ltm)


### Name: unidimTest
### Title: Unidimensionality Check using Modified Parallel Analysis
### Aliases: unidimTest
### Keywords: multivariate

### ** Examples

## Not run: 
##D # Unidimensionality Check for the LSAT data-set
##D # under a Rasch model:
##D out <- unidimTest(rasch(LSAT))
##D out
##D plot(out, type = "b", pch = 1:2)
##D legend("topright", c("Real Data", "Average Simulated Data"), lty = 1, 
##D     pch = 1:2, col = 1:2, bty = "n")
## End(Not run)



