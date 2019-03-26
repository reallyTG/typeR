library(algstat)


### Name: condorcet
### Title: Find a Condorcet Choice.
### Aliases: condorcet

### ** Examples

data(city)

condorcet(city[,"city"], colnames(city))    # among city-dwellers
condorcet(city[,"suburb"], colnames(city))  # among suburb-dwellers
condorcet(city[,"country"], colnames(city)) # among country-dwellers
condorcet(rowSums(city), colnames(city))    # overall winner



