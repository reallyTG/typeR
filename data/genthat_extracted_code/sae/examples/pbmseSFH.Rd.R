library(sae)


### Name: pbmseSFH
### Title: Parametric bootstrap mean squared error estimators of the
###   spatial EBLUPs under a spatial Fay-Herriot model.
### Aliases: pbmseSFH
### Keywords: method

### ** Examples

data(grapes)       # Load data set
data(grapesprox)   # Load proximity matrix

# Obtain the fitting values, naive and bias-corrected parametric bootstrap MSE estimates
# using REML method 
set.seed(123)
result <- pbmseSFH(grapehect ~ area + workdays - 1, var, grapesprox, B=2, data=grapes)
result



