library(Rfit)


### Name: rstudent.rfit
### Title: Studentized Residuals for Rank-Based Regression
### Aliases: rstudent.rfit

### ** Examples

x<-runif(47)
y<-rcauchy(47)
qqnorm(rstudent(fit<-rfit(y~x)))
plot(x,rstudent(fit)) ; abline(h=c(-2,2))



