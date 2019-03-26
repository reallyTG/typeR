library(MPTinR)


### Name: select.mpt
### Title: Model Selection with MPTinR
### Aliases: select.mpt

### ** Examples


# This example compares the three versions of the model in 
# Riefer and Batchelder (1988, Figure 2)

data(rb.fig2.data)
model2 <- system.file("extdata", "rb.fig2.model", package = "MPTinR")
model2r.r.eq <- system.file("extdata", "rb.fig2.r.equal", package = "MPTinR")
model2r.c.eq <- system.file("extdata", "rb.fig2.c.equal", package = "MPTinR")

# The full (i.e., unconstrained) model
ref.model <- fit.mpt(rb.fig2.data, model2)
# All r equal
r.equal <- fit.mpt(rb.fig2.data, model2, model2r.r.eq)
# All c equal
c.equal <- fit.mpt(rb.fig2.data, model2, model2r.c.eq)

select.mpt(list(ref.model, r.equal, c.equal))



## Not run: 
##D 
##D # Example from Broder & Schutz (2009)
##D 
##D data(d.broeder, package = "MPTinR")
##D m.2htm <- system.file("extdata", "5points.2htm.model", package = "MPTinR")
##D r.2htm <- system.file("extdata", "broeder.2htm.restr", package = "MPTinR")
##D r.1htm <- system.file("extdata", "broeder.1htm.restr", package = "MPTinR")
##D 
##D br.2htm.fia <- fit.mpt(d.broeder, m.2htm, fia = 50000, fit.aggregated = FALSE)
##D br.2htm.res.fia <- fit.mpt(d.broeder, m.2htm, r.2htm, fia = 50000, fit.aggregated = FALSE)
##D br.1htm.fia <- fit.mpt(d.broeder, m.2htm, r.1htm, fia = 50000, fit.aggregated = FALSE)
##D 
##D select.mpt(list(br.2htm.fia, br.2htm.res.fia, br.1htm.fia))
##D # This table shows that the n (number of trials) is too small to correctly compute 
##D # FIA for the 1HT model (as the penalty for the 1HTM is larger than for the 2HTM, 
##D # although the former is nested in the latter).
##D # This problem with FIA can only be overcome by collecting more trials per participant,
##D # but NOT by collecting more participants (as the penalties are simply summed).
##D 
##D # using the dataset argument we see the same
##D select.mpt(list(br.2htm.fia, br.2htm.res.fia, br.1htm.fia), dataset = 4, output = "full")
##D 
##D select.mpt(list(br.2htm.fia, br.2htm.res.fia, br.1htm.fia),	dataset = 1:10)
## End(Not run)





