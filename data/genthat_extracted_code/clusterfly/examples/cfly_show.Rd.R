library(clusterfly)


### Name: cfly_show
### Title: Show in ggobi. Opens an instance ggobi for this dataset (if not
###   already open), and colours the points according the cluster
###   assignment.
### Aliases: cfly_show
### Keywords: dynamic

### ** Examples

o <- olive_example()
cfly_show(o, 1)
cfly_show(o, "Region")
if (!interactive()) close(o)



