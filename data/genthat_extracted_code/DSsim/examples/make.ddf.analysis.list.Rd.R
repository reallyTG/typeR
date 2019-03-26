library(DSsim)


### Name: make.ddf.analysis.list
### Title: Creates a list of DDF.Analysis objects
### Aliases: make.ddf.analysis.list

### ** Examples

# A simple half-normal "ds" model can be created using the default values
ddf.analyses <- make.ddf.analysis.list()

# To incorporate model selection between a 'hn' and 'hr' model:
ddf.analyses <- make.ddf.analysis.list(dsmodel = list(~cds(key = "hn",
 formula = ~1),~cds(key = "hr", formula = ~1)), method = "ds", 
 criteria = "AIC")




