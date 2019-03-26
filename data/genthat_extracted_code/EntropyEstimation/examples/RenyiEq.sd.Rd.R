library(EntropyEstimation)


### Name: RenyiEq.sd
### Title: RenyiEq.sd
### Aliases: RenyiEq.sd

### ** Examples

 x = c(1,3,7,4,8) 
 RenyiEq.sd(x,2)  
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 RenyiEq.sd(counts,2)



