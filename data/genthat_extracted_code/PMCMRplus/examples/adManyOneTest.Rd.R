library(PMCMRplus)


### Name: adManyOneTest
### Title: Anderson-Darling Many-To-One Comparison Test
### Aliases: adManyOneTest adManyOneTest.default adManyOneTest.formula
### Keywords: htest nonparametric

### ** Examples

## Data set PlantGrowth
## Global test
adKSampleTest(weight ~ group, data = PlantGrowth)

##
ans <- adManyOneTest(weight ~ group,
                             data = PlantGrowth,
                             p.adjust.method = "holm")
summary(ans)



