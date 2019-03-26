library(cocorresp)


### Name: fitted.symcoca
### Title: Fitted values of a Symmetric Co-Correpsondence analysis model.
### Aliases: fitted.symcoca print.fitted.symcoca
### Keywords: multivariate

### ** Examples

## symmetric CoCA
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)

## fit the model
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")

## fitted values
bp.fit <- fitted(bp.sym)
## No test: 
bp.fit
## End(No test)



