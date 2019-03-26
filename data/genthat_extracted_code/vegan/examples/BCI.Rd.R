library(vegan)


### Name: BCI
### Title: Barro Colorado Island Tree Counts
### Aliases: BCI BCI.env
### Keywords: datasets

### ** Examples

data(BCI, BCI.env)
head(BCI.env)
## see changed species names
oldnames <- attr(BCI, "original.names")
taxa <- cbind("Old Names" = oldnames, "Current Names" = names(BCI))
noquote(taxa[taxa[,1] != taxa[,2], ])



