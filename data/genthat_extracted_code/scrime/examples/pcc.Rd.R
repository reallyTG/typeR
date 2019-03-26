library(scrime)


### Name: pcc
### Title: Pearson's Contingency Coefficient
### Aliases: pcc
### Keywords: manip

### ** Examples
## Not run: 
##D # Generate a data set consisting of 10 rows and 200 columns,
##D # where the values are randomly drawn from the integers 1, 2, and 3.
##D 
##D mat <- matrix(sample(3, 2000, TRUE), 10)
##D 
##D # For each pair of rows of mat, the value of the corrected Pearson's 
##D # contingency coefficient is then obtained by
##D 
##D out1 <- pcc(mat)
##D out1
##D 
##D # and the distances based on this coefficient by
##D 
##D out2 <- pcc(mat, dist = TRUE)
##D out2
##D 
##D # Note that if version is set to 1 (default) in pcc, then
##D 
##D all.equal(sqrt(1 - out1^2), out2)
##D 
## End(Not run)


