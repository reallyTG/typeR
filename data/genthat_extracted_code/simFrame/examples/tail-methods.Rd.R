library(simFrame)


### Name: tail-methods
### Title: Methods for returning the last parts of an object
### Aliases: tail-methods tail,SampleSetup-method tail,SimControl-method
###   tail,SimResults-method tail,Strata-method
###   tail,VirtualContControl-method tail,VirtualDataControl-method
###   tail,VirtualNAControl-method tail,VirtualSampleControl-method
### Keywords: methods manip

### ** Examples

## load data
data(eusilcP)

## class "SampleSetup"
# set up samples using group sampling
set <- setup(eusilcP, grouping = "hid", size = 1000, k = 50)
summary(set)
# get the last 10 indices of each of the last 5 samples
tail(set, k = 5, n = 10)

## class "Strata"
# set up samples using group sampling
strata <- stratify(eusilcP, "region")
summary(strata)
# get strata information for the last 10 observations
tail(strata, 10)



