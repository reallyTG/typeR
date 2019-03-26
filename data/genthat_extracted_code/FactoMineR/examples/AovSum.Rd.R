library(FactoMineR)


### Name: AovSum
### Title: Analysis of variance with the contrasts sum (the sum of the
###   coefficients is 0)
### Aliases: AovSum
### Keywords: models

### ** Examples

## Example two-way anova
data(senso)
res <- AovSum(Score~ Product + Day , data=senso)
res

## Example two-way anova with interaction
data(senso)
res2 <- AovSum(Score~ Product + Day + Product : Day, data=senso)
res2

## Example ancova
data(footsize)
res3 <- AovSum(footsize ~ size + sex + size : sex, data=footsize)
res3



