library(pim)


### Name: response
### Title: Extract response from a pim.formula or a pim object
### Aliases: response response,pim.formula-method response,pim-method

### ** Examples

data('FEVData')
Model <- pim(FEV~ Smoke*Sex , data=FEVData)
response(Model)

# In pieces
FEVenv <- new.pim.env(FEVData, compare="unique")
FEVform <- new.pim.formula(
  Age ~ I(L(Height) - R(Height))  ,
  FEVenv
)
response(FEVform)



