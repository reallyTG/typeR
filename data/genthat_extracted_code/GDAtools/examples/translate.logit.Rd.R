library(GDAtools)


### Name: translate.logit
### Title: Translate logit regression coefficients into percentages
### Aliases: translate.logit
### Keywords: multivariate

### ** Examples

## An example for binomial logit regression
data(Music)
translate.logit(Daily ~ Gender + Age,Music)
translate.logit(Daily ~ Gender + Age,Music,100)

## An example for multinomial logit regression
translate.logit(OnlyMus ~ Gender + Age,Music)



