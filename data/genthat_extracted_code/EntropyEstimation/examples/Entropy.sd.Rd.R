library(EntropyEstimation)


### Name: Entropy.sd
### Title: Entropy.sd
### Aliases: Entropy.sd

### ** Examples

 x = c(1,3,7,4,8) # vector of counts
 Entropy.sd(x)  # Estimated standard deviation
 
 data = rbinom(10,20,.5)
 counts = tabulate(as.factor(data))
 Entropy.sd(counts)



