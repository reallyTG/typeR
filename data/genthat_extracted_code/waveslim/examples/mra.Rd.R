library(waveslim)


### Name: mra
### Title: Multiresolution Analysis of Time Series
### Aliases: mra
### Keywords: ts

### ** Examples

## Easy check to see if it works...
x <- rnorm(32)
x.mra <- mra(x)
sum(x - apply(matrix(unlist(x.mra), nrow=32), 1, sum))^2

## Figure 4.19 in Gencay, Selcuk and Whitcher (2001)
data(ibm)     
ibm.returns <- diff(log(ibm))
ibm.volatility <- abs(ibm.returns)
## Haar
ibmv.haar <- mra(ibm.volatility, "haar", 4, "dwt")
names(ibmv.haar) <- c("d1", "d2", "d3", "d4", "s4")
## LA(8)
ibmv.la8 <- mra(ibm.volatility, "la8", 4, "dwt")
names(ibmv.la8) <- c("d1", "d2", "d3", "d4", "s4")
## plot multiresolution analysis of IBM data
par(mfcol=c(6,1), pty="m", mar=c(5-2,4,4-2,2))
plot.ts(ibm.volatility, axes=FALSE, ylab="", main="(a)")
for(i in 1:5)
  plot.ts(ibmv.haar[[i]], axes=FALSE, ylab=names(ibmv.haar)[i])
axis(side=1, at=seq(0,368,by=23), 
  labels=c(0,"",46,"",92,"",138,"",184,"",230,"",276,"",322,"",368))
par(mfcol=c(6,1), pty="m", mar=c(5-2,4,4-2,2))
plot.ts(ibm.volatility, axes=FALSE, ylab="", main="(b)")
for(i in 1:5)
  plot.ts(ibmv.la8[[i]], axes=FALSE, ylab=names(ibmv.la8)[i])
axis(side=1, at=seq(0,368,by=23), 
  labels=c(0,"",46,"",92,"",138,"",184,"",230,"",276,"",322,"",368))



