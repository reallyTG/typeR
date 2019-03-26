library(scrime)


### Name: smc
### Title: Simple Matching Coefficient and Cohen's Kappa
### Aliases: smc cohen
### Keywords: manip

### ** Examples
## Not run: 
##D # Generate a data set consisting of 10 rows and 200 columns,
##D # where the values are randomly drawn from the integers 1, 2, and 3.
##D 
##D mat <- matrix(sample(3, 2000, TRUE), 10)
##D 
##D # For each pair of row, the value of the simple matching coefficient
##D # can be obtained by
##D 
##D smc(mat)
##D 
##D # and the distance based on the SMC by
##D 
##D smc(mat, dist = TRUE)
##D 
## End(Not run)


