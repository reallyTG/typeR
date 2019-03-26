library(PMCMRplus)


### Name: adAllPairsTest
### Title: Anderson-Darling All-Pairs Comparison Test
### Aliases: adAllPairsTest adAllPairsTest.default adAllPairsTest.formula
### Keywords: htest nonparametric

### ** Examples

adKSampleTest(count ~ spray, InsectSprays)

out <- adAllPairsTest(count ~ spray, InsectSprays, p.adjust="holm")
summary(out)
summaryGroup(out)




