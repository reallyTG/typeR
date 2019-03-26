library(asympTest)


### Name: seMean
### Title: se functions
### Aliases: seMean seMean.default seVar seVar.default seDMean
###   seDMean.default seDMeanG seDMeanG.default seDVar seDVar.default
###   seRMean seRMean.default seRVar seRVar.default
### Keywords: htest univar

### ** Examples

x <- rnorm(70, mean = 1, sd = 2)
y <- rnorm(50, mean = 2, sd = 1)
## mean statistic 
asymp.test(x)$stat
mean(x)/seMean(x)
## variance statistic
asymp.test(x,param="var",alt="l",param0=2)$stat
(var(x)-2)/seVar(x)
## difference of means statistic
asymp.test(x,y)$stat
(mean(x)-mean(y))/seDMean(x,y)



