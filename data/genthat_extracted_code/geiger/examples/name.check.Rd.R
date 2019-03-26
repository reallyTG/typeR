library(geiger)


### Name: name.check
### Title: Compares taxa in data and tree
### Aliases: name.check
### Keywords: arith

### ** Examples


data(geospiza)

tmp <- name.check(geospiza$phy, geospiza$dat)
tmp

## then match data to tree
newphy <- drop.tip(geospiza$phy, tip=tmp$tree_not_data)

## name check should now say "OK"
name.check(newphy, geospiza$dat)

## this can all be done in one step using treedata
td <- treedata(geospiza$phy, geospiza$dat)
td

all(td$phy$tip.label == newphy$tip.label)




