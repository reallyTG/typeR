library(asypow)


### Name: info.mvloglin
### Title: Expected Information Matrix for a Multivariate Log-Linear Model
### Aliases: info.mvloglin
### Keywords: htest

### ** Examples

# Find the information matrix for a multivariate
# log-linear design with variables x, y and z
#    Define coefficient matrix so that 
#    u = .1 + .2*x + .3*y + .3*z
coef <- c(.1, .2, .3, .4)
#    Define the design matrix so that there are 10 design points
intercept <- rep(1, 10)
x <- seq(.1, .2, length=10)
y <- seq(.25, .3, length=10)
z <- seq(.2, .3, length=10)
design <- cbind(intercept, x, y, z)
#    Use info.mvloglin to find the information matrix for
#    this design
info.xyz <- info.mvloglin(coef, design)
print(info.xyz)



