library(pim)


### Name: vcov
### Title: Methods for vcov
### Aliases: vcov vcov,pim-method vcov,list-method

### ** Examples

data(FEVData)
Model <- pim(FEV~ Age + Smoke*Sex , data=FEVData)
vcov(Model)



