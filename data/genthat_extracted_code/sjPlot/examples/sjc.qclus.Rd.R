library(sjPlot)


### Name: sjc.qclus
### Title: Compute quick cluster analysis
### Aliases: sjc.qclus

### ** Examples

## Not run: 
##D # k-means clustering of mtcars-dataset
##D sjc.qclus(mtcars)
##D 
##D # k-means clustering of mtcars-dataset with 4 pre-defined
##D # groups in a faceted panel
##D sjc.qclus(airquality, groupcount = 4, facet.grid = TRUE)
## End(Not run)

# k-means clustering of airquality data
# and saving the results. most likely, 3 cluster
# groups have been found (see below).
airgrp <- sjc.qclus(airquality)

# "re-plot" cluster groups, without computing
# new k-means cluster analysis.
sjc.qclus(airquality, groupcount = 3, groups = airgrp$classification)




