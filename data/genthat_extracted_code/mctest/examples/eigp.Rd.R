library(mctest)


### Name: eigprop
### Title: Eigenvalues and Variance Decomposition Proportion
### Aliases: eigprop
### Keywords: eigenvalues condition number condition indices variance
###   decomposition proportion multicollinearity

### ** Examples

## Hald Cement data
data(Hald)
x<-Hald[,-1]

# with Intercept term
eigprop(x)

# without Intercept term
eigprop(x, Inter = FALSE)

# different proportion threshold
eigprop(x, prop = 0.45)

# only variance proportions
eigprop(x)$pi

# only condition indices
eigprop(x)$ci

# only eigenvalues
eigprop(x)$ev



