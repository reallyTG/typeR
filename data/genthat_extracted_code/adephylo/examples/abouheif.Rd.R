library(adephylo)


### Name: abouheif.moran
### Title: Abouheif's test based on Moran's I
### Aliases: abouheif.moran

### ** Examples



if(require(ade4)&& require(ape) && require(phylobase)){
## load data
data(ungulates)
tre <- read.tree(text=ungulates$tre)
x <- phylo4d(tre, ungulates$tab)

## Abouheif's tests for each trait
myTests <- abouheif.moran(x)
myTests
plot(myTests)

## a variant using another proximity
plot(abouheif.moran(x, method="nNodes") )

## Another example

data(maples)
tre <- read.tree(text=maples$tre)
dom <- maples$tab$Dom

## Abouheif's tests for each trait (equivalent to Cmean)
W1 <- proxTips(tre,method="oriAbouheif")
abouheif.moran(dom,W1)

## Equivalence with moran.idx

W2 <- proxTips(tre,method="Abouheif")
abouheif.moran(dom,W2)
moran.idx(dom,W2) 
}




