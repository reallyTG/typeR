library(PMCMRplus)


### Name: bwsAllPairsTest
### Title: BWS All-Pairs Comparison Test
### Aliases: bwsAllPairsTest bwsAllPairsTest.default
###   bwsAllPairsTest.formula
### Keywords: htest nonparametric

### ** Examples


out <- bwsAllPairsTest(count ~ spray, InsectSprays, p.adjust="holm")
summary(out)
summaryGroup(out)




