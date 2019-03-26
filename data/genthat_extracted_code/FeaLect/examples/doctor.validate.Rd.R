library(FeaLect)


### Name: doctor.validate
### Title: Validates a model using validating samples.
### Aliases: doctor.validate
### Keywords: regression multivariate classif models

### ** Examples

tls <- c(1,1,1,0,0)
ps <- c(1,1,0,1,0)
names(tls) <- 1:5; names(ps) <- 1:5

doctor.validate(true.labels=tls, predictions=ps)




