library(eba)


### Name: eba.order
### Title: Elimination-by-Aspects (EBA) Models with Order-Effect
### Aliases: eba.order summary.eba.order anova.eba.order vcov.eba.order
###   print.eba.order print.summary.eba.order L.order L.constrained.order
###   logLik.eba.order plot.eba.order residuals.eba.order
###   deviance.eba.order
### Keywords: models

### ** Examples

data(heaviness)                # weights judging data
ebao1 <- eba.order(heaviness)  # Davidson-Beaver model
summary(ebao1)                 # goodness of fit
plot(ebao1)                    # residuals versus predicted values
confint(ebao1)                 # confidence intervals for parameters



