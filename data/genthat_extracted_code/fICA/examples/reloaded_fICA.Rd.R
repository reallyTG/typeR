library(fICA)


### Name: reloaded_fICA
### Title: Reloaded Deflation-based FastICA Method for Independent
###   Component Analysis
### Aliases: reloaded_fICA reloaded_fICA.default
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
res1<-reloaded_fICA(X)
coef(res1)
plot(res1) 
require(JADE)
MD(coef(res1),A)

# nonlinearity pow3 and method "G" is chosen as follows
res2<-reloaded_fICA(X,g="pow3",method="G")
coef(res2)
require(JADE)
MD(coef(res2),A)




