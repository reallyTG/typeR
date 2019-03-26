library(sae)


### Name: npbmseSFH
### Title: Nonparametric bootstrap mean squared error estimator of the
###   spatial EBLUPs under a spatial Fay-Herriot model.
### Aliases: npbmseSFH
### Keywords: method

### ** Examples

data(grapes)       # Load data set
data(grapesprox)   # Load proximity matrix

# Obtain the naive and bias-corrected non parametric bootstrap MSE 
# estimates using REML 
set.seed(123)
result <- npbmseSFH(grapehect ~ area + workdays - 1, var, grapesprox, B=2, data=grapes)
result



