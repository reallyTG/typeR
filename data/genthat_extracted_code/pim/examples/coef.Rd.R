library(pim)


### Name: coef
### Title: Extract the coefficients from a pim or pim.summary object
### Aliases: coef coef,pim-method coef,pim.summary-method

### ** Examples

data("FEVData")
Model <- pim(FEV~ Age + Smoke*Sex , data=FEVData)
coef(Model)
summ <- summary(Model)
coef(summ)




