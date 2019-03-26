library(pim)


### Name: print
### Title: Print methods for the different object types
### Aliases: print print,pim-method print,pim.environment-method
###   print,pim.poset-method print,pim.formula-method

### ** Examples

data(FEVData)
Model <- pim(FEV~ Smoke*Sex , data=FEVData)
print(Model)
print(penv(Model))
# You get the drift




