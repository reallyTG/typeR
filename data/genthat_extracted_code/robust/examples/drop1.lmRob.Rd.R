library(robust)


### Name: drop1.lmRob
### Title: Compute an Anova Object by Dropping Terms
### Aliases: drop1.lmRob
### Keywords: robust regression methods

### ** Examples

data(stack.dat)
stack.rob <- lmRob(Loss ~ ., data = stack.dat) 
drop1(stack.rob) 



