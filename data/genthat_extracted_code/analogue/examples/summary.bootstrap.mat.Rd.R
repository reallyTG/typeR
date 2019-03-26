library(analogue)


### Name: summary.bootstrap.mat
### Title: Summarise bootstrap resampling for MAT models
### Aliases: summary.bootstrap.mat print.summary.bootstrap.mat
### Keywords: methods

### ** Examples

## Not run: 
##D ## continue the RLGH example from ?join
##D example(join)
##D 
##D ## fit the MAT model using the squared chord distance measure
##D swap.mat <- mat(swapdiat, swappH, method = "SQchord")
##D 
##D ## bootstrap training set
##D swap.boot <- bootstrap(swap.mat, k = 10, n.boot = 100)
##D swap.boot
##D summary(swap.boot)
## End(Not run)



