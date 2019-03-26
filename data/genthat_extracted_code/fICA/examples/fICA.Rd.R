library(fICA)


### Name: fICA
### Title: Symmetric and Deflation-based FastICA Methods for Independent
###   Component Analysis
### Aliases: fICA fICA.default
### Keywords: multivariate

### ** Examples

# creating some toy data
A<- matrix(rnorm(9),3,3)
s1 <- rt(1000,6)
s2 <- rexp(1000,1)
s3 <- runif(1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

# tanh is the default nonlinearity
res1<-fICA(X,method="sym")
coef(res1)
plot(res1) 
require(JADE)
MD(coef(res1),A)

# nonlinearity pow3 is chosen as follows
res2<-fICA(X,g="pow3",method="sym")
coef(res2)
require(JADE)
MD(coef(res2),A)

# nonlinearity from gf is chosen as follows
res3<-fICA(X,g=gf[[6]],dg=dgf[[6]],method="sym")
coef(res3)
require(JADE)
MD(coef(res3),A)




