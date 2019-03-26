library(geiger)


### Name: rescale
### Title: Tree transformations
### Aliases: rescale.phylo rescale
### Keywords: manip graphs

### ** Examples



geo <- get(data(geospiza))

## returning a function
ltrns <- rescale(geo$phy, "lambda")
plot(ltrns(0))
title("lambda: 0.0")

plot(ltrns(0.5))
title("lambda: 0.5")

plot(ltrns(1))
title("lambda: 1")


## transforming the tree
lphy <- rescale(geo$phy, "lambda", 0.5) # transform tree in one fell swoop
plot(lphy)
title("lambda: 0.5")

## multirate tree -- time
rtrns <- rescale(geo$phy, "nrate")
rphy <- rtrns(time=c(0.2, 0.4, 0.6, 0.8), rate=c(2, 4, 8, 16))
plot(rphy)
title("5-rate tree: by time")

## multirate tree -- lineages
mtrns <- rescale(geo$phy, "lrate")
mphy <- mtrns(node=c(25, 20), rate=c(4, 8))
plot(mphy)
title("3-rate tree: by lineages")




