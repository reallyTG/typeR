library(PMCMRplus)


### Name: vanWaerdenManyOneTest
### Title: van-der-Waerden's Many-One Comparisons Normal Scores Test
### Aliases: vanWaerdenManyOneTest vanWaerdenManyOneTest.default
###   vanWaerdenManyOneTest.formula
### Keywords: htest nonparametric

### ** Examples

## Data set PlantGrowth
## Global test
vanWaerdenTest(weight ~ group, data = PlantGrowth)

## van-der-Waerden's many-one comparison test
ans <- vanWaerdenManyOneTest(weight ~ group,
                             data = PlantGrowth,
                             p.adjust.method = "holm")
summary(ans)



