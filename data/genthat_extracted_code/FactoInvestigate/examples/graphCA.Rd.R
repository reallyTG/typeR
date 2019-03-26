library(FactoInvestigate)


### Name: graphCA
### Title: Correspondance Analysis factor map
### Aliases: graphCA
### Keywords: graphs

### ** Examples

require(FactoMineR)
data(children)
res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
graphCA(res.ca)



