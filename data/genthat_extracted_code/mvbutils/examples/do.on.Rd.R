library(mvbutils)


### Name: do.on
### Title: Easier sapply/lapply avoiding explicit function
### Aliases: do.on FOR
### Keywords: misc

### ** Examples

do.on( 1:7, sum(1:.))
#  1  2  3  4  5  6  7
# 1  3  6 10 15 21 28
# note the numeric "names" in the first row
FOR( 1:3, sum(1:.))



