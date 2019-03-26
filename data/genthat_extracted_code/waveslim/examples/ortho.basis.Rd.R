library(waveslim)


### Name: ortho.basis
### Title: Derive Orthonormal Basis from Wavelet Packet Tree
### Aliases: ortho.basis
### Keywords: ts

### ** Examples

data(japan)
J <- 4
wf <- "mb8"
japan.mra <- mra(log(japan), wf, J, boundary="reflection")
japan.nomean <-
  ts(apply(matrix(unlist(japan.mra[-(J+1)]), ncol=J, byrow=FALSE), 1, sum),
     start=1955, freq=4)
japan.nomean2 <- ts(japan.nomean[42:169], start=1965.25, freq=4)
plot(japan.nomean2, type="l")
japan.dwpt <- dwpt(japan.nomean2, wf, 6)
japan.basis <-
  ortho.basis(portmanteau.test(japan.dwpt, p=0.01, type="other"))
# Not implemented yet
# par(mfrow=c(1,1))
# plot.basis(japan.basis)



