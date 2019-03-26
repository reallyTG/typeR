library(globalOptTests)


### Name: goTest
### Title: Call an objective function
### Aliases: goTest
### Keywords: optimization

### ** Examples

goTest(fnName="Ackleys", par=rnorm(10))
goTest(fnName="AluffiPentini", par=c(1,2))
goTest(fnName="AluffiPentini",
par=rep(1,getProblemDimen("AluffiPentini")))

## use in an optimization via 'optim'
optim(par=c(1,2), fn=goTest, fnName="AluffiPentini")



