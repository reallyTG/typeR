library(asd)


### Name: combn.test
### Title: Combination Tests for ASD
### Aliases: combn.test
### Keywords: design

### ** Examples


stage1 <- dunnett.test(c(0.75,1.5,2.25))
stage2 <- dunnett.test(c(0.15,1.75,2.15))
combn.test(stage1,stage2,weight=0.5,method="invnorm")




