library(randomUniformForest)


### Name: rUniformForest.big
### Title: Random Uniform Forests for Classification and Regression with
###   large data sets
### Aliases: rUniformForest.big

### ** Examples

## not run
## Classification: synthetic data
# n = 100;  p = 10 ## for ease of use, we consider small 'n'
## Simulate 'p' gaussian vectors with random parameters between -10 and 10.
#X <- simulationData(n,p)

## Make a rule to create response vector
# epsilon1 = runif(n,-1,1)
# epsilon2 = runif(n,-1,1)
# rule = 2*(X[,1]*X[,2] + X[,3]*X[,4]) + epsilon1*X[,5] + epsilon2*X[,6]

# Y <- as.factor(ifelse(rule > mean(rule), 1, 0))

# big.ruf <- timer(rUniformForest.big(X, Y, nforest = 2, 
# threads = 1, BreimanBounds = FALSE, replacement = TRUE, importance = FALSE))

## elapsing time
# big.ruf$time 

## OOB accuracy
# big.ruf$object

## standard model
# std.ruf <- timer(randomUniformForest(X, Y, threads = 1, ntree = 20, BreimanBounds = FALSE))

## elapsing time. Note that for small 'n' standard case will be faster.
# std.ruf$time  

## OOB accuracy
#std.ruf$object

## not run
##  regression
# Y = rule
# big.ruf <- timer(rUniformForest.big(X, Y, nforest = 2, 
# threads = 2, BreimanBounds = FALSE, subsample = 0.7))
# big.ruf  

## classic random uniform forest 
# std.ruf <- timer(randomUniformForest(X, Y, threads = 2, BreimanBounds = FALSE))
# std.ruf  # accuracy gap is much larger in case of regression

## but, one can consider a new case, e.g. shifting distribution, to see how it works
# newX <- simulationData(n,p)
# epsilon1 = runif(n,-1,1)
# epsilon2 = runif(n,-1,1)
# newRule = 2*(X[,1]*X[,2] + X[,3]*X[,4]) + epsilon1*X[,5] + epsilon2*X[,6]
# newY = newRule 

## predict using standard model
# pred.std.ruf <- predict(std.ruf$object, newX)

## get mean squared error
# sum( (pred.std.ruf - newY)^2 )/length(newY)

## predict using rUniformForest.big
# pred.big.ruf <- predict(big.ruf$object, newX)

## get mean squared error : both errors will be more closer, and for large 'n' (and more trees), 
## rUniformForest.big might have lower error
# sum( (pred.big.ruf - newY)^2 )/length(newY)



