library(TTmoment)


### Name: TTmoment-package
### Title: Truncated Multivariate t (TMVT) Distribution
### Aliases: TTmoment-package TTmoment
### Keywords: TMVT package

### ** Examples

# A test example
rho=0.9
S=matrix(c(1, rho ,rho, 1),2,2)
nu=5
p=2
mu = rep(0, p)
Y= TT.GS(n=10000, mu, S, nu, lower=c(1,2), upper=c(4,6))
# Empirical first moment
y.bar=colMeans(Y)
y.bar
# Sample covariance matrix
S.y=cov(Y)
S.y

M.Y=TT.moment(R=S, nu, lower=c(1,2), upper=c(4,6))
# First two moments
M.Y$EX
M.Y$EXX
# Covariance matrix
M.Y$EXX-M.Y$EX%*%t(M.Y$EX)



