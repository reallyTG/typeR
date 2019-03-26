library(Canopy)


### Name: initialP
### Title: To initialize clonal frequency matrix
### Aliases: initialP
### Keywords: package

### ** Examples

data(MDA231_tree)
data(MDA231)
sampname = colnames(MDA231$R)
initialP(MDA231_tree, sampname, cell.line = TRUE)



