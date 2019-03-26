library(pmml)


### Name: pmml.nnet
### Title: Generate PMML for nnet objects
### Aliases: pmml.nnet

### ** Examples


library(nnet)
fit <- nnet(Species ~ ., data=iris, size=4)
pmml(fit)

rm(fit)




