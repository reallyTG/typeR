library(plm)


### Name: pmodel.response
### Title: A function to extract the model.response
### Aliases: pmodel.response pmodel.response.data.frame
###   pmodel.response.formula pmodel.response.plm
### Keywords: manip

### ** Examples

# First, make a pdata.frame
data(Grunfeld)
pGrunfeld <- pdata.frame(Grunfeld)

# then make a model frame from a pFormula and a pdata.frame
pform <- pFormula(inv ~ value + capital)
mf <- model.frame(pform, data = pGrunfeld)

# construct (transformed) response of the within model
resp <- pmodel.response(pform, data = mf, model = "within", effect = "individual")

# retrieve (transformed) response directly from model frame
resp_mf <- pmodel.response(mf, model = "within", effect = "individual")

# retrieve (transformed) response from a plm object, i.e. an estimated model
fe_model <- plm(pform, data = pGrunfeld, model = "within")
pmodel.response(fe_model)

# same as constructed before
all.equal(resp, pmodel.response(fe_model), check.attributes = FALSE) # TRUE



