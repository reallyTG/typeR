library(flexclust)


### Name: info
### Title: Get Information on Fitted Flexclust Objects
### Aliases: info,flexclust,character-method
### Keywords: cluster

### ** Examples

data("Nclus")
plot(Nclus)

cl1 <- cclust(Nclus, k=4)
summary(cl1)

## these two are the same
info(cl1)
info(cl1, "help")

## cluster sizes
i1 <- info(cl1, "size")
i1

## average within cluster distances
i2 <- info(cl1, "av_dist")
i2

## the sum of all within-cluster distances
i3 <- info(cl1, "distsum")
i3

## sum(i1*i2) must of course be the same as i3
stopifnot(all.equal(sum(i1*i2), i3))



## This should return TRUE
infoCheck(cl1, "size")
## and this FALSE
infoCheck(cl1, "Homer Simpson")
## both combined
i4 <- infoCheck(cl1, c("size", "Homer Simpson"))
i4

stopifnot(all.equal(i4, c(TRUE, FALSE)))



