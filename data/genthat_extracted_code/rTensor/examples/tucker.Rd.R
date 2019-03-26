library(rTensor)


### Name: tucker
### Title: Tucker Decomposition
### Aliases: tucker

### ** Examples

tnsr <- rand_tensor(c(4,4,4,4))
tuckerD <- tucker(tnsr,ranks=c(2,2,2,2))
tuckerD$conv 
tuckerD$norm_percent
plot(tuckerD$all_resids)



