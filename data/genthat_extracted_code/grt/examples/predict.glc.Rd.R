library(grt)


### Name: predict.glc
### Title: predict method for General Linear Classifier
### Aliases: predict.glc
### Keywords: models

### ** Examples

data(subjdemo_2d)
fit.2dl <- glc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)

m <- list(c(187, 142), c(213.4, 97.7))
covs <- diag(c(900, 900))
newd <- grtrnorm(n=20, np=2, means=m, covs=covs, seed=1234)
predict(fit.2dl, newd[,2:3], seed=1234)



