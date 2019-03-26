library(pim)


### Name: has.intercept
### Title: Check whether formula has an explicit intercept
### Aliases: has.intercept has.intercept,character-method
###   has.intercept,formula-method has.intercept,terms-method
###   has.intercept,pim.formula-method has.intercept,pim-method

### ** Examples

data("FEVData")
# Create the "model frame"
FEVenv <- new.pim.env(FEVData, compare="unique")
# create the formula and bind it to the pim.environment.
FEVform <- new.pim.formula(
  Age ~ I(L(Height) - R(Height))  ,
  FEVenv
)
has.intercept(FEVform)
FEVform2 <- new.pim.formula(Age ~ Height + 1, FEVData)
has.intercept(FEVform2)




