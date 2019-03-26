library(grt)


### Name: logLik.gqcStruct
### Title: Log-Likelihood of a 'gqcStruct' Object
### Aliases: logLik.gqcStruct
### Keywords: models

### ** Examples

m <- list(c(187, 142), c(213, 98))
covs <- list(diag(625, ncol=2, nrow=2), diag(600, ncol=2, nrow=2))
db <- qdb(means=m, covs=covs)
data(subjdemo_2d)
logLik(db, subjdemo_2d$response, x=subjdemo_2d[2:3], zlimit=7)



