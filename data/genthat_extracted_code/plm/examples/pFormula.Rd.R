library(plm)


### Name: pFormula
### Title: pFormula: An extended Formula interface for panel data
### Aliases: pFormula as.Formula.pFormula
### Keywords: classes

### ** Examples

# First, make a pdata.frame
data("Grunfeld", package = "plm")
pGrunfeld <- pdata.frame(Grunfeld)

# then make a model frame from a pFormula and a pdata.frame
pform <- pFormula(inv ~ value + capital)
mf <- model.frame(pform, data = pGrunfeld)

# then construct the (transformed) model matrix (design matrix)
# from formula and model frame
modmat <- model.matrix(pform, data = mf, model = "within")



