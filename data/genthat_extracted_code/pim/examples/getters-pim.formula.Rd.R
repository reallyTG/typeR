library(pim)


### Name: has.specials
### Title: Extract information from a pim.formula object
### Aliases: has.specials lhs, terms, has.specials,pim.formula-method terms
###   terms,pim.formula-method lhs lhs,pim.formula-method

### ** Examples

data("FEVData")
# Create the "model frame"
FEVenv <- new.pim.env(FEVData, compare="unique")

# create the formula and bind it to the pim.environment.
FEVform <- new.pim.formula(
  Age ~ I(L(Height) - R(Height))  ,
  FEVenv
)
lhs(FEVform)
has.specials(FEVform)
penv(FEVform)

FEVform2 <- new.pim.formula(
  FEV ~ Height*Sex,
  FEVenv
)

has.specials(FEVform2)
terms(FEVform2)




