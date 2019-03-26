library(bda)


### Name: mixnorm
### Title: The mixed normal distribution
### Aliases: pmixnorm dmixnorm qmixnorm rmixnorm
### Keywords: distribution

### ** Examples


p <- c(.4,.6)
mu <- c(1,4)
s <- c(2,3)
dmixnorm(c(0,1,2,20),p,mu,s)
pmixnorm(c(0,1,2,20),p,mu,s)
qmixnorm(c(0,1,.2,.20),p,mu,s)
rmixnorm(3,p,mu,s)




