library(CorrBin)


### Name: egde
### Title: EGDE data
### Aliases: egde
### Keywords: datasets

### ** Examples

  data(egde)
  stripchart(I(NResp/ClusterSize)~Trt, cex=sqrt(egde$Freq), data=egde, pch=1, 
             method="jitter", vertical=TRUE, ylab="Proportion affected")



