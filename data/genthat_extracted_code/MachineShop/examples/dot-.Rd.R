library(MachineShop)


### Name: .
### Title: Quote Operator
### Aliases: .

### ** Examples

## Stepwise variable selection with BIC
library(MASS)

glmfit <- fit(medv ~ ., Boston, GLMStepAICModel(k = .(log(nobs))))
varimp(glmfit)




