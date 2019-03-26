library(BinNor)


### Name: compute.sigma.star
### Title: Computes intermediate (tetrachoric) correlation matrix
### Aliases: compute.sigma.star

### ** Examples

cmat = lower.tri.to.corr.mat(corr.vec= c(0.16, 0.04, 0.38, 0.14, 0.47, 0.68),4)
compute.sigma.star(no.bin=2, no.nor=2, prop.vec.bin=c(0.4,0.7), 
corr.vec=NULL,corr.mat=cmat)



