library(HoRM)


### Name: psi.andrew
### Title: Andrew's Sine Function
### Aliases: psi.andrew
### Keywords: file

### ** Examples
 
## Robust fit of the stackloss dataset.

require(MASS)

data(stackloss, package="datasets")

out <- rlm(stack.loss ~ ., data = stackloss, 
           psi = psi.andrew)

out



