library(Correlplot)


### Name: fit_angles
### Title: Fit angles to a correlation matrix
### Aliases: fit_angles
### Keywords: optimize

### ** Examples

X <- matrix(rnorm(90),ncol=3)
R <- cor(X)
angles <- fit_angles(R)
print(angles)



