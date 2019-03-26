library(geiger)


### Name: treedata
### Title: compare taxa in data and tree
### Aliases: treedata
### Keywords: manip data graphs

### ** Examples


geo <- get(data(geospiza))

treedata(geo$phy, geo$dat, sort=TRUE, warnings=TRUE)




