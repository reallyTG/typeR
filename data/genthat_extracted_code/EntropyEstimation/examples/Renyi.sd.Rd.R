library(EntropyEstimation)


### Name: Renyi.sd
### Title: Renyi.sd
### Aliases: Renyi.sd

### ** Examples

 x = c(1,3,7,4,8)
 Renyi.sd(x,2)  
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 Renyi.sd(counts,2)



