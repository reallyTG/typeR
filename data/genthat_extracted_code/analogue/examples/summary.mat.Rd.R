library(analogue)


### Name: summary.mat
### Title: Summarise Modern Analogue Technique models
### Aliases: summary.mat print.summary.mat
### Keywords: methods

### ** Examples

## Not run: 
##D ## continue the RLGH example from ?join
##D example(join)
##D 
##D ## fit the MAT model using the squared chord distance measure
##D swap.mat <- mat(swapdiat, swappH, method = "SQchord")
##D swap.mat
##D 
##D ## model summary
##D summary(swap.mat)
##D 
##D ## model summary - evaluating models using k = 1, ..., 20
##D ## analogues instead of the default, 10.
##D summary(swap.mat, k = 20)
## End(Not run)



