library(MPTinR)


### Name: get.mpt.fia
### Title: Convenient function to get FIA for MPT
### Aliases: get.mpt.fia

### ** Examples


# Get the FIA for the 40 datasets from Broeder & Schuetz (2009, Experiment 3)
# for the 2HTM model with inequality restrictions
# (Can take a while.)

data(d.broeder)
m.2htm <- system.file("extdata", "5points.2htm.model", package = "MPTinR")
i.2htm <- system.file("extdata", "broeder.2htm.ineq", package = "MPTinR")

get.mpt.fia(d.broeder, m.2htm, Sample = 1000) # Way too little samples
get.mpt.fia(d.broeder, m.2htm, i.2htm, Sample = 1000)

## Not run: 
##D # should produce very similar results:
##D get.mpt.fia(d.broeder, m.2htm, i.2htm)
##D get.mpt.fia(d.broeder, m.2htm, i.2htm, mConst = 2L^8)
## End(Not run)
  


