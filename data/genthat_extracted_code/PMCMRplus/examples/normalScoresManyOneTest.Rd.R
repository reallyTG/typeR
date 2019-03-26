library(PMCMRplus)


### Name: normalScoresManyOneTest
### Title: Lu-Smith Many-One Comparisons Normal Scores Test
### Aliases: normalScoresManyOneTest normalScoresManyOneTest.default
###   normalScoresManyOneTest.formula
### Keywords: htest nonparametric

### ** Examples

## Data set PlantGrowth
## Global test
normalScoresTest(weight ~ group, data = PlantGrowth)

## Lu-Smith's many-one comparison test
ans <- normalScoresManyOneTest(weight ~ group, data = PlantGrowth, p.adjust.method = "holm")
summary(ans)



