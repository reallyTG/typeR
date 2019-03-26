library(flexclust)


### Name: bwplot-methods
### Title: Box-Whisker Plot Methods in Package 'flexclust'
### Aliases: bwplot,kcca-method bwplot,kccasimple-method
###   bwplot,bclust-method
### Keywords: methods hplot

### ** Examples

  set.seed(1)
  cl <- cclust(iris[,-5], k=3, save.data=TRUE)
  bwplot(cl)
  bwplot(cl, byvar=TRUE)

  ## fill only boxes with color which do not contain the overall median
  ## (grey dot of background box)
  bwplot(cl, shade=TRUE)

  ## fill only boxes with color which do not overlap with the box of the
  ## complete sample (grey background box)
  bwplot(cl, shadefun="boxOverlap")



