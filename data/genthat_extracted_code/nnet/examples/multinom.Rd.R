library(nnet)


### Name: multinom
### Title: Fit Multinomial Log-linear Models
### Aliases: multinom add1.multinom anova.multinom coef.multinom
###   drop1.multinom extractAIC.multinom predict.multinom print.multinom
###   summary.multinom print.summary.multinom vcov.multinom
###   model.frame.multinom logLik.multinom
### Keywords: neural models

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))
library(MASS)
example(birthwt)
(bwt.mu <- multinom(low ~ ., bwt))



