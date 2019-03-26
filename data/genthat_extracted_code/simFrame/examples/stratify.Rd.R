library(simFrame)


### Name: stratify
### Title: Stratify data
### Aliases: stratify stratify-methods
###   stratify,data.frame,BasicVector-method
### Keywords: manip methods

### ** Examples

data(eusilcP)
strata <- stratify(eusilcP, c("region", "gender"))
summary(strata)



