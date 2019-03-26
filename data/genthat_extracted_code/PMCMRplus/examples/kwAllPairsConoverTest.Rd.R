library(PMCMRplus)


### Name: kwAllPairsConoverTest
### Title: Conover's All-Pairs Rank Comparison Test
### Aliases: kwAllPairsConoverTest kwAllPairsConoverTest.default
###   kwAllPairsConoverTest.formula
### Keywords: htest nonparametric

### ** Examples

## Data set InsectSprays
## Global test
kruskalTest(count ~ spray, data = InsectSprays)

## Conover's all-pairs comparison test
## single-step means Tukey's p-adjustment
ans <- kwAllPairsConoverTest(count ~ spray, data = InsectSprays,
                             p.adjust.method = "single-step")
summary(ans)

## Dunn's all-pairs comparison test
ans <- kwAllPairsDunnTest(count ~ spray, data = InsectSprays,
                             p.adjust.method = "bonferroni")
summary(ans)

## Nemenyi's all-pairs comparison test
ans <- kwAllPairsNemenyiTest(count ~ spray, data = InsectSprays)
summary(ans)



