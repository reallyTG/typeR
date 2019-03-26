library(waveslim)


### Name: dwt
### Title: Discrete Wavelet Transform (DWT)
### Aliases: dwt dwt.nondyadic idwt
### Keywords: ts

### ** Examples

## Figures 4.17 and 4.18 in Gencay, Selcuk and Whitcher (2001).
data(ibm)     
ibm.returns <- diff(log(ibm))
## Haar
ibmr.haar <- dwt(ibm.returns, "haar")
names(ibmr.haar) <- c("w1", "w2", "w3", "w4", "v4")
## plot partial Haar DWT for IBM data
par(mfcol=c(6,1), pty="m", mar=c(5-2,4,4-2,2))
plot.ts(ibm.returns, axes=FALSE, ylab="", main="(a)")
for(i in 1:4)
  plot.ts(up.sample(ibmr.haar[[i]], 2^i), type="h", axes=FALSE,
          ylab=names(ibmr.haar)[i])
plot.ts(up.sample(ibmr.haar$v4, 2^4), type="h", axes=FALSE,
        ylab=names(ibmr.haar)[5])
axis(side=1, at=seq(0,368,by=23), 
     labels=c(0,"",46,"",92,"",138,"",184,"",230,"",276,"",322,"",368))
## LA(8)
ibmr.la8 <- dwt(ibm.returns, "la8")
names(ibmr.la8) <- c("w1", "w2", "w3", "w4", "v4")
## must shift LA(8) coefficients
ibmr.la8$w1 <- c(ibmr.la8$w1[-c(1:2)], ibmr.la8$w1[1:2])
ibmr.la8$w2 <- c(ibmr.la8$w2[-c(1:2)], ibmr.la8$w2[1:2])
for(i in names(ibmr.la8)[3:4])
  ibmr.la8[[i]] <- c(ibmr.la8[[i]][-c(1:3)], ibmr.la8[[i]][1:3])
ibmr.la8$v4 <- c(ibmr.la8$v4[-c(1:2)], ibmr.la8$v4[1:2])
## plot partial LA(8) DWT for IBM data
par(mfcol=c(6,1), pty="m", mar=c(5-2,4,4-2,2))
plot.ts(ibm.returns, axes=FALSE, ylab="", main="(b)")
for(i in 1:4)
  plot.ts(up.sample(ibmr.la8[[i]], 2^i), type="h", axes=FALSE,
          ylab=names(ibmr.la8)[i])
plot.ts(up.sample(ibmr.la8$v4, 2^4), type="h", axes=FALSE,
        ylab=names(ibmr.la8)[5])
axis(side=1, at=seq(0,368,by=23), 
  labels=c(0,"",46,"",92,"",138,"",184,"",230,"",276,"",322,"",368))



