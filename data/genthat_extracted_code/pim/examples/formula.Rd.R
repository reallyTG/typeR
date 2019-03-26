library(pim)


### Name: formula
### Title: Extract the formula from a pim or pim.formula object
### Aliases: formula formula,pim-method formula,pim.formula-method

### ** Examples

data("DysData")
themodel <- pim(SPC_D2 ~ Chemo, data = DysData)

thepimform <- formula(themodel)
formula(thepimform)
formula(themodel, orig = TRUE)




