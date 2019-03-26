library(simFrame)


### Name: length-methods
### Title: Methods for getting the length of an object
### Aliases: length-methods length,SampleSetup-method
###   length,VirtualContControl-method length,VirtualNAControl-method
###   length,VirtualSampleControl-method
### Keywords: methods attribute

### ** Examples

## load data
data(eusilcP)

## class "SampleSetup"
# set up samples using group sampling
set <- setup(eusilcP, grouping = "hid", size = 1000, k = 50)
summary(set)
length(set)

## class "ContControl"
cc <- ContControl(target = "eqIncome", 
    epsilon = c(0, 0.0025, 0.005, 0.0075, 0.01), 
    dots = list(mean = 5e+05, sd = 10000))
length(cc)

## class "NAControl"
nc <- NAControl(target = "eqIncome", NArate = c(0.1, 0.2, 0.3))
length(nc)



