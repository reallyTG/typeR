library(CORElearn)


### Name: ordDataGen
### Title: Artificial data for testing ordEval algorithms
### Aliases: ordDataGen
### Keywords: data datagen

### ** Examples

#prepare a data set
dat <- ordDataGen(200)

# evaluate ordered features with ordEval
est <- ordEval(class ~ ., dat, ordEvalNoRandomNormalizers=100)
# print(est)  
plot(est)



