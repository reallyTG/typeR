library(BSDA)


### Name: Laminect
### Title: Median costs of laminectomies at hospitals across North Carolina
###   in 1992
### Aliases: Laminect
### Keywords: datasets

### ** Examples


boxplot(cost ~ area, data = Laminect, col = topo.colors(3))
anova(lm(cost ~ area, data = Laminect))




