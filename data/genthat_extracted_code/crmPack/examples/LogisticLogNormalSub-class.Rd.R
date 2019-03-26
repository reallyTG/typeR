library(crmPack)


### Name: LogisticLogNormalSub-class
### Title: Standard logistic model with bivariate (log) normal prior with
###   substractive dose standardization
### Aliases: LogisticLogNormalSub-class .LogisticLogNormalSub
### Keywords: classes

### ** Examples



model <- LogisticLogNormalSub(mean = c(-0.85, 1),
                           cov = matrix(c(1, -0.5, -0.5, 1), nrow = 2),
                           refDose = 50)





