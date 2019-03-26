library(Replication)


### Name: llratio.f
### Title: Likelihood ratio statistic for constrained versus unconstrained
###   model
### Aliases: llratio.f
### Keywords: htest

### ** Examples

data <- data.frame(y=ChickWeight$weight,g=ChickWeight$Diet)
aggregate(data$y,by=list(data$g),mean)
reg <- lm(data$y~data$g)
BKcov <- vcov(reg)
Q <- reg$coefficients

#b1=102, b3-b2>20, b3-b4>10, b4>30
R <- rbind(c(1,0,0,0),c(0,-1,1,0),c(0,0,1,-1),c(0,0,0,1))
r = c(102,20,10,30)
E = 1

llratio.f(BKcov=BKcov, Q=Q, R=R, r=r, E = E)



