library(rTensor)


### Name: mpca
### Title: Multilinear Principal Components Analysis
### Aliases: mpca

### ** Examples

subject <- faces_tnsr[,,21,]
mpcaD <- mpca(subject,ranks=c(10,10))
mpcaD$conv
mpcaD$norm_percent
plot(mpcaD$all_resids)



