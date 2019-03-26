library(DescTools)


### Name: Cstat
### Title: C Statistic (Area Under the ROC Curve)
### Aliases: Cstat Cstat.glm Cstat.default
### Keywords: mod

### ** Examples

r.glm <- glm(Survived ~ ., data=Untable(Titanic), family=binomial)

Cstat(r.glm)



