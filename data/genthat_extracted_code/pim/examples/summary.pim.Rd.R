library(pim)


### Name: summary.pim
### Title: The summary function for the pim class
### Aliases: summary.pim summary summary,pim-method

### ** Examples

data(FEVData)
Model <- pim(FEV~ Age + Smoke*Sex , data=FEVData)
summary(Model)




