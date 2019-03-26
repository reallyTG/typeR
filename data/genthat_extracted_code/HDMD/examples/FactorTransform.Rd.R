library(HDMD)


### Name: FactorTransform
### Title: Metric Solution for Amino Acid characters
### Aliases: FactorTransform FactorTransform.default FactorTransform.vector

### ** Examples


FactorTransform("HDMD", Replace= AAMetric.Atchley)

data(bHLH288)
bHLH_Seq = as.vector(bHLH288[,2])
bHLH_ccList = FactorTransform(bHLH_Seq, Factor=4)
bHLH_ms     = FactorTransform(bHLH_Seq, Factor=3, alignment=TRUE)

bHLH_ms[c(20:25, 137:147, 190:196, 220:229, 264:273),1:8]



