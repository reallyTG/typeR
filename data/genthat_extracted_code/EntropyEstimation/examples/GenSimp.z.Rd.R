library(EntropyEstimation)


### Name: GenSimp.z
### Title: GenSimp.z
### Aliases: GenSimp.z

### ** Examples

 x = c(1,3,7,4,8) 
 GenSimp.z(x,2)  
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 GenSimp.z(counts,2)



