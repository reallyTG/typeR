library(waveslim)


### Name: modwt
### Title: (Inverse) Maximal Overlap Discrete Wavelet Transform
### Aliases: modwt imodwt
### Keywords: ts

### ** Examples

## Figure 4.23 in Gencay, Selcuk and Whitcher (2001)
data(ibm)     
ibm.returns <- diff(log(ibm))
# Haar
ibmr.haar <- modwt(ibm.returns, "haar")
names(ibmr.haar) <- c("w1", "w2", "w3", "w4", "v4")
# LA(8)
ibmr.la8 <- modwt(ibm.returns, "la8")
names(ibmr.la8) <- c("w1", "w2", "w3", "w4", "v4")
# shift the MODWT vectors
ibmr.la8 <- phase.shift(ibmr.la8, "la8")
## plot partial MODWT for IBM data
par(mfcol=c(6,1), pty="m", mar=c(5-2,4,4-2,2))
plot.ts(ibm.returns, axes=FALSE, ylab="", main="(a)")
for(i in 1:5)
  plot.ts(ibmr.haar[[i]], axes=FALSE, ylab=names(ibmr.haar)[i])
axis(side=1, at=seq(0,368,by=23), 
  labels=c(0,"",46,"",92,"",138,"",184,"",230,"",276,"",322,"",368))
par(mfcol=c(6,1), pty="m", mar=c(5-2,4,4-2,2))
plot.ts(ibm.returns, axes=FALSE, ylab="", main="(b)")
for(i in 1:5)
  plot.ts(ibmr.la8[[i]], axes=FALSE, ylab=names(ibmr.la8)[i])
axis(side=1, at=seq(0,368,by=23), 
  labels=c(0,"",46,"",92,"",138,"",184,"",230,"",276,"",322,"",368))



