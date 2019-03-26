library(hdrcde)


### Name: hdrbw
### Title: Highest Density Region Bandwidth
### Aliases: hdrbw
### Keywords: distribution smooth

### ** Examples


HDRlevelVal <- 0.55
x <- faithful$eruptions
hHDR <- hdrbw(x,HDRlevelVal)
HDRhat <- hdr.den(x,prob=100*(1-HDRlevelVal),h=hHDR)




