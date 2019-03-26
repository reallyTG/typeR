library(EntropyEstimation)


### Name: Entropy.z
### Title: Entropy.z
### Aliases: Entropy.z

### ** Examples

 x = c(1,3,7,4,8) 
 Entropy.z(x)  
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 Entropy.z(counts)



