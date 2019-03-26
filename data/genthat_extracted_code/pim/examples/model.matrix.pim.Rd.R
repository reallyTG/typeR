library(pim)


### Name: model.matrix.pim
### Title: Create a model matrix for a probabilistic index model
### Aliases: model.matrix.pim model.matrix model.matrix.pim.formula
###   model.matrix,pim-method model.matrix,pim.formula-method

### ** Examples

data("FEVData")
# Create the "model frame"
FEVenv <- new.pim.env(FEVData, compare="unique")
# This includes the poset
pos <- poset(FEVenv, as.list=TRUE)

# create the formula and bind it to the pim.environment.
FEVform <- new.pim.formula(
  Age ~ I(L(Height) - R(Height))  ,
  FEVenv
)

# Use this formula object to construct the model matrix
# use the default model ( difference )
MM <- model.matrix(FEVform)

# Use this formula object to construct the pseudo response
Y <- response(FEVform)

# Now pim.fit can do what it does
res <- pim.fit(MM,Y, estim = "estimator.glm", penv=FEVenv)




