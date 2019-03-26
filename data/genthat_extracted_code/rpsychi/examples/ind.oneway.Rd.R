library(rpsychi)


### Name: ind.oneway
### Title: A one-way design with independent samples using individual data:
###   Reporting effect size
### Aliases: ind.oneway
### Keywords: design htest

### ** Examples

##Kline (2004) Table 6.3
dat <- data.frame(y = c(9,12,13,15,16,
                       8,12,11,10,14,
                       10,11,13,11,15),
                  x =  rep(factor(c("a","b","c")), each=5)
                  )                 
ind.oneway(formula = y~x, data=dat, sig.level=.05, digits=3)


##contrast 1: a - c, contrast 2: 1/2(a + c) - b
my.cont <- matrix(c(1,0,-1,1/2,-1,1/2), ncol=3, nrow=2, byrow=TRUE)
ind.oneway(formula = y~x, data=dat, contr=my.cont, sig.level=.05, digits=3)




