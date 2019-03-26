library(heplots)


### Name: Sake
### Title: Taste Ratings of Japanese Rice Wine (Sake)
### Aliases: Sake
### Keywords: datasets

### ** Examples

data(Sake)
# quick look at the data
boxplot(scale(Sake))

Sake.mod <- lm(cbind(taste,smell) ~ ., data=Sake)

library(car)
Anova(Sake.mod)

predictors <- colnames(Sake)[-(1:2)]                 
# overall multivariate regression test
linearHypothesis(Sake.mod, predictors)

heplot(Sake.mod, hypotheses=list("Regr" = predictors))



