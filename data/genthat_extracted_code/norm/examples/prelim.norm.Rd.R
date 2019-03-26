library(norm)


### Name: prelim.norm
### Title: Preliminary manipulations for a matrix of incomplete continuous
###   data.
### Aliases: prelim.norm
### Keywords: multivariate

### ** Examples

data(mdata)
s <- prelim.norm(mdata)  #do preliminary manipulations 
s$nmis[s$co] #look at nmis 
s$r #look at missing data patterns



