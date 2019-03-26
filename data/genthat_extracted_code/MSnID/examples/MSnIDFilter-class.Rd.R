library(MSnID)


### Name: MSnIDFilter-class
### Title: The "MSnIDFilter" Class for Handling MS/MS Criteria,
###   Relationships and Thresholds for Data Filtration.
### Aliases: MSnIDFilter-class class:MSnIDFilter MSnIDFilter
###   show,MSnIDFilter-method $,MSnIDFilter-method $<-,MSnIDFilter-method
###   as.numeric,MSnIDFilter-method length,MSnIDFilter-method
###   update,MSnIDFilter-method names,MSnIDFilter-method
### Keywords: classes

### ** Examples

data(c_elegans)

## Filtering using filter object:
# first adding columns that will be used as filters
msnidObj$msmsScore <- -log10(msnidObj$`MS-GF:SpecEValue`)
msnidObj$mzError <- abs(msnidObj$experimentalMassToCharge - 
                        msnidObj$calculatedMassToCharge)
# setting up filter object
filtObj <- MSnIDFilter(msnidObj)
filtObj$msmsScore <- list(comparison=">", threshold=10.0)
filtObj$mzError <- list(comparison="<", threshold=0.1) # 0.1 Thomson
show(filtObj)
# applying filter and comparing MSnID object before and after
show(msnidObj)
msnidObj <- apply_filter(msnidObj, filtObj)
show(msnidObj)



