library(CorrBin)


### Name: shelltox
### Title: Shell Toxicology data
### Aliases: shelltox
### Keywords: datasets

### ** Examples

  data(shelltox)
  stripchart(I(NResp/ClusterSize)~Trt, cex=sqrt(shelltox$Freq), data=shelltox, pch=1, 
             method="jitter", vertical=TRUE, ylab="Proportion affected")



