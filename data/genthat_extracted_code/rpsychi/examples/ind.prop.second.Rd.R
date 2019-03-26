library(rpsychi)


### Name: ind.prop.second
### Title: A Z test for the equality of two proportions using published
###   workc
### Aliases: ind.prop.second
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
ind.prop.second(x=tab[,1], n = rowSums(tab))             #Risk for relapse is lower in treatment than control condition.
ind.prop.second(x=tab[,1], n = rowSums(tab), ref.ind=2)  #Risk for relapse is higher in control than treatment condition.



