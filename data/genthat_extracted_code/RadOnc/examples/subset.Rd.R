library(RadOnc)


### Name: subset.DVH.list
### Title: Extract a subset of a larger DVH list
### Aliases: subset-methods subset.DVH.list subset,DVH-method
###   subset,DVH.list-method
### Keywords: methods manip

### ** Examples

data(list="RadOnc", package="RadOnc")
subset(johndoe, structure="kidney", constraint="Dmean < 500(cGy)", ignore.case=TRUE)
subset(johndoe, constraint="volume > 200(cc)")


