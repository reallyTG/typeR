library(simFrame)


### Name: head-methods
### Title: Methods for returning the first parts of an object
### Aliases: head-methods head,SampleSetup-method head,SimControl-method
###   head,SimResults-method head,Strata-method
###   head,VirtualContControl-method head,VirtualDataControl-method
###   head,VirtualNAControl-method head,VirtualSampleControl-method
### Keywords: methods manip

### ** Examples

## load data
data(eusilcP)

## class "SampleSetup"
# set up samples using group sampling
set <- setup(eusilcP, grouping = "hid", size = 1000, k = 50)
summary(set)
# get the first 10 indices of each of the first 5 samples
head(set, k = 5, n = 10)

## class "Strata"
# set up samples using group sampling
strata <- stratify(eusilcP, "region")
summary(strata)
# get strata information for the first 10 observations
head(strata, 10)



