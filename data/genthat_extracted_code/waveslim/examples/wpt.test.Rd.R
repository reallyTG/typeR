library(waveslim)


### Name: wpt.test
### Title: Testing the Wavelet Packet Tree for White Noise
### Aliases: cpgram.test css.test entropy.test portmanteau.test
### Keywords: ts

### ** Examples

data(mexm)
J <- 6
wf <- "la8"
mexm.dwpt <- dwpt(mexm[-(1:4)], wf, J)
## Not implemented yet
## plot.dwpt(x.dwpt, J)
mexm.dwpt.bw <- dwpt.brick.wall(mexm.dwpt, wf, 6, method="dwpt")
mexm.tree <- ortho.basis(portmanteau.test(mexm.dwpt.bw, p=0.025))
## Not implemented yet
## plot.basis(mexm.tree)



