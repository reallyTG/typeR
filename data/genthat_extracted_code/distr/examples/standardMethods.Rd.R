library(distr)


### Name: standardMethods
### Title: Utility to automatically generate accessor and replacement
###   functions
### Aliases: standardMethods
### Keywords: utilities programming

### ** Examples

setClass("testclass", representation(a = "numeric", b = "character"))
standardMethods("testclass")



