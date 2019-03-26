library(staRdom)


### Name: abs_parms
### Title: Calculating slopes and slope ratios of a data frame of
###   absorbance data.
### Aliases: abs_parms

### ** Examples

## No test: 
data(abs_data)
abs_parms(abs_data[,1:5],5)
abs_parms(abs_data[,1:5],5,l_ref=list(NA,NA,NA), lref=TRUE) # fit lref as well
## End(No test)



