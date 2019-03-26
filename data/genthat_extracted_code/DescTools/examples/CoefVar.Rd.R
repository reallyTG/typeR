library(DescTools)


### Name: CoefVar
### Title: Coefficient of Variation
### Aliases: CoefVar CoefVar.lm CoefVar.aov CoefVar.default
### Keywords: univar

### ** Examples

set.seed(15)
x <- runif(100)
CoefVar(x, conf.level=0.95)

#       est    low.ci    upr.ci
# 0.5092566 0.4351644 0.6151409

# Coefficient of variation for a linear model
r.lm <- lm(Fertility ~ ., swiss)
CoefVar(r.lm)



