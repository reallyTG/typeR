library(simFrame)


### Name: summary-methods
### Title: Methods for producing a summary of an object
### Aliases: summary-methods summary,SampleSetup-method
###   summary,SimControl-method summary,SimResults-method
###   summary,Strata-method summary,VirtualContControl-method
###   summary,VirtualDataControl-method summary,VirtualNAControl-method
###   summary,VirtualSampleControl-method
### Keywords: methods

### ** Examples

## load data
data(eusilcP)

## class "SampleSetup"
# set up samples using group sampling
set <- setup(eusilcP, grouping = "hid", size = 1000, k = 50)
summary(set)

## class "Strata"
# set up samples using group sampling
strata <- stratify(eusilcP, "region")
summary(strata)



