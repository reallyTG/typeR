library(parsnip)


### Name: nullmodel
### Title: Fit a simple, non-informative model
### Aliases: nullmodel nullmodel.default predict.nullmodel print.nullmodel
### Keywords: models

### ** Examples


outcome <- factor(sample(letters[1:2],
                         size = 100,
                         prob = c(.1, .9),
                         replace = TRUE))
useless <- nullmodel(y = outcome)
useless
predict(useless, matrix(NA, nrow = 5))




