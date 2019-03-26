library(pedometrics)


### Name: gcpDiff
### Title: Difference on xyz coordinates between ground control points
### Aliases: gcpDiff
### Keywords: methods

### ** Examples


## Not run: 
##D ## Create an spsurvey.analysis object
##D my.spsurvey <- 
##D   spsurvey.analysis(design = coordenadas(my.data),
##D                     data.cont = delta(ref.data, my.data),
##D                     popcorrect = TRUE, pcfsize = length(my.data$id),
##D                     support = rep(1, length(my.data$id)),
##D                     wgt = rep(1, length(my.data$id)), vartype = "SRS")
## End(Not run)




