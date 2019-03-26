library(mistat)


### Name: PRED
### Title: Soldering Points
### Aliases: PRED
### Keywords: datasets

### ** Examples

data(PRED)

library(boot)

set.seed(123)

YRatioPred <- boot(data=PRED$x, 
                   statistic=function(x,i){
                     mean(x[i[1:100]])*7.495/148.58
                     }, 
                   R=1000)$t

hist(YRatioPred, main="", 
     xlab="", 
     xlim=c(7, 8))



