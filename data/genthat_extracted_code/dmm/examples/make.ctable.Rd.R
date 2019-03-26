library(dmm)


### Name: make.ctable
### Title: Generates a list of vectors containing sets of variance
###   component names
### Aliases: make.ctable
### Keywords: misc

### ** Examples


library(dmm)
# make a ctable
tmp <- make.ctable()
# see its structure
str(tmp)
# look at all additive genetic variances
tmp$addgvar
# tidy up
rm(tmp)



