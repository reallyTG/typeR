library(PMCMRplus)


### Name: kwManyOneNdwTest
### Title: Nemenyi-Damico-Wolfe Many-to-One Rank Comparison Test
### Aliases: kwManyOneNdwTest kwManyOneNdwTest.default
###   kwManyOneNdwTest.formula
### Keywords: htest nonparametric

### ** Examples

## Data set PlantGrowth
## Global test
kruskalTest(weight ~ group, data = PlantGrowth)

## Conover's many-one comparison test
## single-step means p-value from multivariate t distribution
ans <- kwManyOneConoverTest(weight ~ group, data = PlantGrowth,
                             p.adjust.method = "single-step")
summary(ans)

## Conover's many-one comparison test
ans <- kwManyOneConoverTest(weight ~ group, data = PlantGrowth,
                             p.adjust.method = "holm")
summary(ans)

## Dunn's many-one comparison test
ans <- kwManyOneDunnTest(weight ~ group, data = PlantGrowth,
                             p.adjust.method = "holm")
summary(ans)

## Nemenyi's many-one comparison test
ans <- kwManyOneNdwTest(weight ~ group, data = PlantGrowth,
                        p.adjust.method = "holm")
summary(ans)



