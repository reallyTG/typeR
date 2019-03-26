library(BinNor)


### Name: validation.range
### Title: Checks if the correlation terms are within the feasible range
### Aliases: validation.range

### ** Examples

cmat=lower.tri.to.corr.mat(corr.vec=c(0.16,0.04,0.38,0.4,0.47,0.68),4) 
validation.range(no.bin=2, no.nor=2, prop.vec.bin=c(0.4,0.7), corr.mat=cmat)



