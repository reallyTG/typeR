library(asypow)


### Name: info.reparam
### Title: Reparameterize Expected Information Matrix
### Aliases: info.reparam
### Keywords: htest

### ** Examples

# A logistic model posits that the probability of response
# is a logtistic function of a + b*x.
# Consider the value of x that produces 50%
# response, x = -a/b. Since -a/b is not one of the parameters
# of the model, we must reparameterize to
# roe[1] = -a/b
# roe[2] = b
dg <- function(theta) {
# theta is a vector of length 2 containing c(a,b)
# dg <- [d{roe[1]}/d{a} d{roe[1]}/d{b}
#        d{roe[2]}/d{a} d{roe[2]}/d{b}]
  a <- theta[1]
  b <- theta[2]
  return(matrix(c(-1/b,a/b^2,0,1), nrow=2, ncol=2, byrow=TRUE))
}
# Let a = -0.9 and b = .7
theta <- c(-.9, .7)
# assign a set of covariate values
covar <- c(0.3, .9, 1.3, 2.5)
# Use info.binomial.design to calculate the information
# matrix under the original parameterization
info.orig <- info.binomial.design(model="linear", link="logistic", 
                                  theta=theta, xpoints=covar)
# Get the information matrix of the reparameterized model
info.new <- info.reparam(theta, info.orig, dg)
print(info.new)



