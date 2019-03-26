library(sae)


### Name: mseSFH
### Title: Mean squared error estimator of the spatial EBLUP under a
###   spatial Fay-Herriot model.
### Aliases: mseSFH
### Keywords: method

### ** Examples

data(grapes)       # Load data set
data(grapesprox)   # Load proximity matrix 

# Calculate analytical MSE estimates using REML method
result <- mseSFH(grapehect ~ area + workdays - 1, var, grapesprox, data=grapes)
result



