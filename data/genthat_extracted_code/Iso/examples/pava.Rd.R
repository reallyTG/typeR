library(Iso)


### Name: pava
### Title: Linear order isotonic regression.
### Aliases: pava pava.sa
### Keywords: regression nonlinear

### ** Examples

# Increasing order:
y <- (1:20) + rnorm(20)
ystar <- pava(y)
plot(y)
lines(ystar,type='s')
# Decreasing order:
z <- NULL
for(i in 4:8) {
	z <- c(z,rep(8-i+1,i)+0.05*(0:(i-1)))
}
zstar <- pava(z,decreasing=TRUE)
plot(z)
lines(zstar,type='s')
# Using the stepfunction:
zstar <- pava(z,decreasing=TRUE,stepfun=TRUE)
plot(z)
plot(zstar,add=TRUE,verticals=FALSE,pch=20,col.points="red")



