library(ISBF)


### Name: isbfReg
### Title: Iterative Selection of Blocks of Features in Regression
###   Estimation - isbfReg
### Aliases: isbfReg

### ** Examples

# generating data
X = matrix(data=rnorm(5000),nr=50,nc=100)
b = c(rep(0,50),rep(-3,30),rep(0,20))
e = rnorm(50,0,0.3)
Y = X%*%b + e

# call of isbfReg
A = isbfReg(X,Y,K=100,v=0.3)

# visualization of the results
plot(b)
lines(A$beta,col="red")



