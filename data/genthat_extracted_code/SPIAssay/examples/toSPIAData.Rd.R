library(SPIAssay)


### Name: toSPIAData
### Title: Function to code SNPs data into SPIA format
### Aliases: toSPIAData
### Keywords: misc

### ** Examples

   SNPcall <- c("snp1",0,1,2,-1)
   encoding <- c(0,2,1,-1)
   SPIA_SNPcall <- toSPIAData(SNPcall, encoding)
   print(SNPcall)
   print(SPIA_SNPcall)



