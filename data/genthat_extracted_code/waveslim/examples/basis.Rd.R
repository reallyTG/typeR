library(waveslim)


### Name: basis
### Title: Produce Boolean Vector from Wavelet Basis Names
### Aliases: basis
### Keywords: ts

### ** Examples

data(acvs.andel8)
## Not run: 
##D x <- hosking.sim(1024, acvs.andel8[,2])
##D x.dwpt <- dwpt(x, "la8", 7)
##D ## Select orthonormal basis from wavelet packet tree
##D x.basis <- basis(x.dwpt, c("w1.1","w2.1","w3.0","w4.3","w5.4","w6.10",
##D                            "w7.22","w7.23"))
##D for(i in 1:length(x.dwpt))
##D   x.dwpt[[i]] <- x.basis[i] * x.dwpt[[i]]
##D ## Resonstruct original series using selected orthonormal basis
##D y <- idwpt(x.dwpt, x.basis)
##D par(mfrow=c(2,1), mar=c(5-1,4,4-1,2))
##D plot.ts(x, xlab="", ylab="", main="Original Series")
##D plot.ts(y, xlab="", ylab="", main="Reconstructed Series")
## End(Not run)



