library(prediction)


### Name: build_datalist
### Title: Build list of data.frames
### Aliases: build_datalist
### Keywords: data manip

### ** Examples

# basic examples
require("datasets")
build_datalist(head(mtcars), at = list(cyl = c(4, 6)))

str(build_datalist(head(mtcars), at = list(cyl = c(4,6), wt = c(2.75,3,3.25))), 1)

str(build_datalist(head(mtcars), at = data.frame(cyl = c(4,4), wt = c(2.75,3))))




