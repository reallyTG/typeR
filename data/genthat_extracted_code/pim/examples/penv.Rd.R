library(pim)


### Name: penv
### Title: Extract a pim environment from a model or formula
### Aliases: penv penv,pim.formula-method penv,pim-method

### ** Examples

data("FEVData")
# Create the "model frame"
FEVenv <- new.pim.env(FEVData, compare="unique")

# create the formula and bind it to the pim.environment.
FEVform <- new.pim.formula(
  Age ~ I(L(Height) - R(Height))  ,
  FEVenv
)
theEnv <- penv(FEVform)
ls(theEnv)

themodel <- pim(Age ~ Height, FEVenv)
thePEnv <- penv(themodel)
thePEnv

ls(thePEnv)
# Note that this is a different environment, and that it only contains
# the variables in the formula, contrary to the environment created
# by new.pim.formula



