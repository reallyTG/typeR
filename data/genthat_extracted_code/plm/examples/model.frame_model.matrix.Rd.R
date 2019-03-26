library(plm)


### Name: model.frame.pFormula
### Title: model.frame and model.matrix for panel data
### Aliases: model.frame.pFormula model.matrix.pFormula model.matrix.plm
###   model.matrix model.frame
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


## retrieve model frame and model matrix from an estimated plm object
fe_model <- plm(pform, data = pGrunfeld, model = "within")
model.frame(fe_model)
model.matrix(fe_model)

# same as constructed before
all.equal(mf, model.frame(fe_model), check.attributes = FALSE) # TRUE
all.equal(modmat, model.matrix(fe_model), check.attributes = FALSE) # TRUE



