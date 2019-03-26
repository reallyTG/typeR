library(rpsychi)


### Name: ind.prop
### Title: A Z test for the equality of two proportions using individual
###   data: Reporting effect size
### Aliases: ind.prop
### Keywords: design htest

### ** Examples

##Kline (2004) Chapter 5
x1 <- c("relapsed", "not relapsed")
y1 <- c("control", "treatment")

dat <- data.frame(y =         
factor(c(rep(x1, c(60, 40)), rep(x1, c(40, 60))), levels=x1),
x = factor(rep(y1, each=100), levels=y1)
)
tab <- xtabs(~x+y, data=dat)
tab
ind.prop(y~x, data=dat, lev.count=2, ref.ind=1)    #Odds for not relapse is higher in treatment than control condition.
ind.prop(y~x, data=dat, lev.count=1, ref.ind=1)    #Odds for relapse is lower in treatment than control condition.
ind.prop(y~x, data=dat, lev.count=2, ref.ind=2)    #Odds for not relapse is lower in control than treatment condition.
ind.prop(y~x, data=dat, lev.count=1, ref.ind=2)    #Odds for relapse is higher in control than treatment condition.



