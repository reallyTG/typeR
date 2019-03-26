library(rpsychi)


### Name: dep.oneway
### Title: A one-way design with dependent samples using individual data:
###   Reporting effect size
### Aliases: dep.oneway
### Keywords: design htest

### ** Examples

##Kline (2004) Table 6.3
dat <- data.frame(y = c(9,12,13,15,16,
                       8,12,11,10,14,
                       10,11,13,11,15),
                  x =  rep(factor(c("a","b","c")), each=5),
                  subj = rep(paste("s", 1:5, sep=""), times=3)
                  )
dep.oneway(formula = y~x, data=dat, block="subj")


##contrast 1: a - c, contrast 2 : 1/2(a + c) - b
my.cont <- matrix(c(1,0,-1,1/2,-1,1/2), ncol=3, nrow=2, byrow=TRUE)
dep.oneway(formula = y~x, data=dat, block="subj", contr=my.cont)



