library(EntropyEstimation)


### Name: RenyiEq.z
### Title: RenyiEq.z
### Aliases: RenyiEq.z

### ** Examples

 x = c(1,3,7,4,8) 
 RenyiEq.z(x,2)  
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 RenyiEq.z(counts,2)



