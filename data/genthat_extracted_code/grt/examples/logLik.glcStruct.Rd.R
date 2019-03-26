library(grt)


### Name: logLik.glcStruct
### Title: Log-Likelihood of a 'glcStruct' or 'gcjcStruct' Object
### Aliases: logLik.glcStruct logLik.gcjcStruct
### Keywords: models

### ** Examples

m <- list(c(187, 142), c(213, 98))
covs <- diag(625, ncol=2, nrow=2)
db <- ldb(means=m, covs=covs, noise=10)
data(subjdemo_2d)
logLik(db, subjdemo_2d$response, x=subjdemo_2d[2:3], zlimit=7)



