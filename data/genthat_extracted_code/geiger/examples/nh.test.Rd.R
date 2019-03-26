library(geiger)


### Name: nh.test
### Title: using the Freckleton and Harvey node-height test
### Aliases: nh.test

### ** Examples

## No test: 
data(whales)

tmp <- treedata(whales$phy, whales$dat[,1])

phy <- tmp$phy
dat <- tmp$data[,1]

nh.test(phy, dat, regression.type="lm", show.plot=TRUE)
## End(No test)



