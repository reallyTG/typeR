library(asypow)


### Name: info.ordinal.design
### Title: Expected Information Matrix for an Ordinal Design
### Aliases: info.ordinal.design
### Keywords: htest

### ** Examples

# Find the information matrix for an ordinal design
# with one group and equal sample sizes.
# Assume 4 categories and use a logistic
# line and quadratic model. Let
# u[1] = 1 + 2.5*x
# u[2] = 2 + 2.5*x
# u[3] = 3 + 2.5*x
# Use values x = -3,0,3
theta <- c(1, 2, 3, 2.5)
covar <- c(-3, 0, 3)
info.ord <- info.ordinal.design(theta = theta, xpoints = covar)
print(info.ord)



