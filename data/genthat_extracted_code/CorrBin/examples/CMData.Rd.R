library(CorrBin)


### Name: CMData
### Title: Create a 'CMdata' object from a data frame.
### Aliases: CMData
### Keywords: classes manip

### ** Examples

data(dehp)
dehp <- CMData(dehp, trt="Trt", nresp=c("NResp.1","NResp.2","NResp.3"))
str(dehp)



