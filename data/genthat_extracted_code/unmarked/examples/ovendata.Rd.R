library(unmarked)


### Name: ovendata
### Title: Removal data for the Ovenbird
### Aliases: ovendata ovendata.list
### Keywords: datasets

### ** Examples

data(ovendata)
str(ovendata.list)
ovenFrame <- unmarkedFrameMPois(ovendata.list$data,
siteCovs=as.data.frame(scale(ovendata.list$covariates[,-1])), type = "removal")



