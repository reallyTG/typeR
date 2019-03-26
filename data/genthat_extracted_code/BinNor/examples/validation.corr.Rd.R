library(BinNor)


### Name: validation.corr
### Title: Validates the specified correlation matrix
### Aliases: validation.corr

### ** Examples

d=4
corr.vec=c(0.21,0.61,0.78,0.10,0.12,0.65)
corr.mat=lower.tri.to.corr.mat(corr.vec,d)	


validation.corr (no.bin=2, no.nor=2,prop.vec.bin=c(0.4,0.7), 
		corr.vec,corr.mat=corr.mat)



