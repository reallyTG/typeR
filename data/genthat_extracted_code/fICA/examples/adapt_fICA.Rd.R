library(fICA)


### Name: adapt_fICA
### Title: Adaptive Deflation-based FastICA Method for Independent
###   Component Analysis
### Aliases: adapt_fICA adapt_fICA.default
### Keywords: multivariate

### ** Examples

A <- matrix(rnorm(9),3,3)
s1 <- rt(1000,6)
s2 <- rexp(1000,1)
s3 <- runif(1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

res1<-adapt_fICA(X, inR=FALSE)
res1
coef(res1)
plot(res1) 

require(JADE)
MD(coef(res1),A)

# changing the set of candidate nonlinearities

?nonlinearities
g <- function(x){x^2}
dg <- function(x){2*x}
gf_new <- c(gf[-c(5,8,10)],g)
dgf_new <- c(dgf[-c(5,8,10)],g)
gnames_new <- c(gnames[-c(5,8,10)],"skew")

res2<-adapt_fICA(X, gs=gf_new, dgs=dgf_new, name=gnames_new)
res2
MD(coef(res2),A)

# reloaded FastICA using tanh

res3<-adapt_fICA(X, gs=gf[2], dgs=dgf[2], name=gnames[2])
res3
MD(coef(res3),A)



