library(googleVis)


### Name: Regions
### Title: Regions: googleVis example data set
### Aliases: Regions
### Keywords: datasets

### ** Examples

data(Regions)
Tree <- gvisTreeMap(Regions,  "Region", "Parent", "Val", "Fac",
                    options=list(width=600, height=500,
                                 showScale=TRUE, fontSize=16))
## Not run: 
##D plot(Tree)
## End(Not run)



