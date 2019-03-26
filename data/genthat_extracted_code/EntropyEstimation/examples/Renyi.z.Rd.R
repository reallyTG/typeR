library(EntropyEstimation)


### Name: Renyi.z
### Title: Renyi.z
### Aliases: Renyi.z

### ** Examples

 x = c(1,3,7,4,8)
 Renyi.z(x,2)  
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 Renyi.z(counts,2)



