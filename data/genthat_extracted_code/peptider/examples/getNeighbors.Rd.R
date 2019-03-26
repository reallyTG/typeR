library(peptider)


### Name: getNeighbors
### Title: Find all neighbors of degree one for a set of peptide sequences
### Aliases: getNeighbors

### ** Examples

getNeighbors("APE")
getNeighbors(c("HI", "APE"))
getNeighbors(c("HI", "EARNEST", "APE"), blosum=3)
## degree 2 neighbors:
unique(unlist(getNeighbors(getNeighbors("APE"))))



