library(Claddis)


### Name: MatrixPruner
### Title: Prunes a character matrix of characters or taxa
### Aliases: MatrixPruner
### Keywords: NEXUS

### ** Examples


# Remove the outgroup taxon and characters 11 and 53 from Gauthier1986:
prunedmatrix <- MatrixPruner(CladisticMatrix = Gauthier1986, characters2prune = c(11, 53),
  taxa2prune = c("Outgroup"))

# Show priuned matrix:
prunedmatrix$Matrix_1$Matrix




