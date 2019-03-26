library(RefFreeEWAS)


### Name: omnibusBoot
### Title: Bootstrap-based omnibus test of significance across all features
### Aliases: omnibusBoot
### Keywords: bootstrap omnibus kolmogorov-smirnov

### ** Examples


data(RefFreeEWAS)

test <- RefFreeEwasModel(
  rfEwasExampleBetaValues,
  cbind(1,rfEwasExampleCovariate),
  4)

testBoot <- BootRefFreeEwasModel(test,10)
summary(testBoot)
omnibusBoot(test$Beta[,2], testBoot[,2,"B",],-diff(dim(test$X))) 
omnibusBoot(test$Bstar[,2], testBoot[,2,"B*",],-diff(dim(test$X)))



