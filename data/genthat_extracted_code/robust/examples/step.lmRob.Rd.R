library(robust)


### Name: step.lmRob
### Title: Build a Model in a Stepwise Fashion
### Aliases: step.lmRob
### Keywords: robust regression methods

### ** Examples

data(stack.dat)
stack.rob <- lmRob(Loss ~ ., data = stack.dat)

## The default behavior is to try dropping all terms ##
step.lmRob(stack.rob)

## Keep Water.Temp in the model ##
my.scope <- list(lower = . ~ Water.Temp, upper = . ~ .)
step.lmRob(stack.rob, scope = my.scope)



