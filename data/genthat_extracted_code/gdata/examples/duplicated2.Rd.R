library(gdata)


### Name: duplicated2
### Title: Determine Duplicate Elements
### Aliases: duplicated2
### Keywords: logic manip

### ** Examples

  data(iris)
  iris[duplicated(iris), ]                 # 2nd duplicated value
  iris[duplicated(iris, fromLast=TRUE), ]  # 1st duplicated value
  iris[duplicated2(iris), ]                # both duplicated values



