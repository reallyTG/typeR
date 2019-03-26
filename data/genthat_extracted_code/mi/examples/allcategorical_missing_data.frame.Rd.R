library(mi)


### Name: allcategorical_missing_data.frame
### Title: Class "allcategorical_missing_data.frame"
### Aliases: allcategorical_missing_data.frame
###   allcategorical_missing_data.frame-class
### Keywords: classes manip AimedAtUseRs

### ** Examples

rdf <- rdata.frame(n_full = 2, n_partial = 2, 
                   restrictions = "stratified", types = "ord")
mdf <- missing_data.frame(rdf$obs, subclass = "allcategorical")



