library(compositions)


### Name: rnorm
### Title: Normal distributions on special spaces
### Aliases: rnorm.acomp rnorm.rcomp rnorm.aplus rnorm.rplus rnorm.rmult
###   rnorm.ccomp dnorm.acomp dnorm.aplus dnorm.rmult
### Keywords: distribution

### ** Examples

MyVar <- matrix(c(
0.2,0.1,0.0,
0.1,0.2,0.0,
0.0,0.0,0.2),byrow=TRUE,nrow=3)
MyMean <- c(1,1,2)

plot(rnorm.acomp(100,MyMean,MyVar))
plot(rnorm.rcomp(100,MyMean,MyVar))
plot(rnorm.aplus(100,MyMean,MyVar))
plot(rnorm.rplus(100,MyMean,MyVar))
plot(rnorm.rmult(100,MyMean,MyVar))
x <- rnorm.aplus(5,MyMean,MyVar)
dnorm.acomp(x,MyMean,MyVar)
dnorm.aplus(x,MyMean,MyVar)
dnorm.rmult(x,MyMean,MyVar)



