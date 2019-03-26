library(asypow)


### Name: info.mvlogistic
### Title: Expected Information Matrix for a Multivariate Logistic Model
### Aliases: info.mvlogistic
### Keywords: htest

### ** Examples

# Find the information matrix for a multivariate
# logistic design with variables x, y and z
#    Define coefficient matrix so that 
#    u = 1 + .5*x + .7*y + .9*z
coef <- c(1, .5, .7, .9)
#    Define the design matrix so that there are 10 design points
intercept <- rep(1, 10)
x <- rnorm(10)
y <- rnorm(10)
z <- rnorm(10)
design <- cbind(intercept, x, y, z)
#    Use info.mvlogistic to find the information matrix for
#    this design
info.xyz <- info.mvlogistic(coef, design)
print(info.xyz)



