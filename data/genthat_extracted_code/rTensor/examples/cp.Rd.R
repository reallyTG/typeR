library(rTensor)


### Name: cp
### Title: Canonical Polyadic Decomposition
### Aliases: cp

### ** Examples

subject <- faces_tnsr[,,14,]
cpD <- cp(subject,num_components=10) 
cpD$conv 
cpD$norm_percent 
plot(cpD$all_resids) 



