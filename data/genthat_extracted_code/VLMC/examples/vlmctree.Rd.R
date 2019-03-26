library(VLMC)


### Name: vlmctree
### Title: Compute the tree structure of a "vlmc" object
### Aliases: vlmctree .vvec2tree str.vtree
### Keywords: ts models

### ** Examples

data(presidents)
dpres <- cut(presidents, c(0,45,70, 100)) # three values + NA
table(dpres <- factor(dpres, exclude = NULL)) # NA as 4th level

(vlmc.prc1 <- vlmc(dpres, cut = 1, debug = TRUE))
str(vv.prc1 <- vlmctree(vlmc.prc1))



