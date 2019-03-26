library(rgl)


### Name: rgl.attrib.info
### Title: Get information about attributes of objects
### Aliases: rgl.attrib.info rgl.attrib.count

### ** Examples

open3d()
id <- points3d(rnorm(100), rnorm(100), rnorm(100), col = "green")
rgl.attrib.info(id, showAll = TRUE)
rgl.attrib.count(id, "vertices")

merge(rgl.attrib.info(), rgl.ids("all"))



