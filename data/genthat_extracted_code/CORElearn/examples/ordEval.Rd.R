library(CORElearn)


### Name: ordEval
### Title: Evaluation of ordered attributes
### Aliases: ordEval
### Keywords: regression nonlinear classif

### ** Examples

#prepare a data set
dat <- ordDataGen(200)

# evaluate ordered features with ordEval
est <- ordEval(class ~ ., dat, ordEvalNoRandomNormalizers=100)
# print(est)
printOrdEval(est)  
plot(est)




