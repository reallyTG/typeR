library(MPTinR)


### Name: gen.data
### Title: Generate or bootstrap data and get predictions from a model
###   specified in a model file (or connection).
### Aliases: gen.data sample.data gen.predictions

### ** Examples

#### using the model and data from Broeder & Schuetz:
data(d.broeder, package = "MPTinR")
m.2htm <- system.file("extdata", "5points.2htm.model", package = "MPTinR")
m.sdt <- "pkg/MPTinR/inst/extdata/broeder.sdt.model"

m.sdt <- system.file("extdata", "broeder.sdt.model", package = "MPTinR")

# fit the 2HTM
br.2htm <- fit.mpt(colSums(d.broeder), m.2htm)

# fit the SDT model
br.sdt <- fit.model(colSums(d.broeder), m.sdt, lower.bound = c(rep(-Inf, 5), 0, 1),
	upper.bound = Inf)

# get one random dataset using the paramater values obtained (i.e., parametric bootstrap) 
# and the data argument.
gen.data(br.2htm[["parameters"]][,1], 1, m.2htm, data = colSums(d.broeder))

gen.data(br.sdt[["parameters"]][,1], 1, m.sdt, data = colSums(d.broeder))

# get one random dataset using the paramater values obtained (i.e., parametric bootstrap) 
# and the n.per.item.type argument.
gen.data(br.2htm[["parameters"]][,1], 1, m.2htm, 
	n.per.item.type = c(240, 2160, 600, 1800, 1200, 1200, 1800, 600, 2160, 240))

gen.data(br.sdt[["parameters"]][,1], 1, m.sdt, 
	n.per.item.type = c(240, 2160, 600, 1800, 1200, 1200, 1800, 600, 2160, 240))

# sample one random dataset from the original data:
sample.data(colSums(d.broeder), 1, model.filename = m.2htm)
# above uses the model.filename argument

sample.data(colSums(d.broeder), 1, categories.per.type = rep(2,10))
# above uses the categories.per.type argument


# just get the predicted proportions:
predictions.mpt <- gen.predictions(br.2htm[["parameters"]][,1], m.2htm)
predictions.sdt <- gen.predictions(br.sdt[["parameters"]][,1], m.sdt)

# predicting using the proactive Inhibiton Model (Riefer & Batchelder, 1988, Figure 1)

model1 <- system.file("extdata", "rb.fig1.model", package = "MPTinR")

gen.predictions(c(r = 0.3, p = 1, q = 0.4944), model1)  
gen.predictions(c(r = 0.3, p = 1, q = 0.4944), model1, n.per.item.type = 180)

# the order of parameters is reordered (i.e., not alphabetically)
# but as the vector is named, it does not matter!
# Compare with:
data(rb.fig1.data, package = "MPTinR")
fit.mpt(rb.fig1.data[1,], model1, n.optim = 1)



