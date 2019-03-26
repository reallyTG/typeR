library(EntropyEstimation)


### Name: GenSimp.sd
### Title: GenSimp.sd
### Aliases: GenSimp.sd

### ** Examples

 x = c(1,3,7,4,8)
 GenSimp.sd(x,2)  
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 GenSimp.sd(counts,2)



