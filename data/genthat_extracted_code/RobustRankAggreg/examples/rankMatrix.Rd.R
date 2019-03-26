library(RobustRankAggreg)


### Name: rankMatrix
### Title: Create rank matrix
### Aliases: rankMatrix

### ** Examples

# Make sample input data
glist <- list(sample(letters, 4), sample(letters, 10), sample(letters, 12))

r = rankMatrix(glist)
r = rankMatrix(glist, full = TRUE)

# Use real data
data(cellCycleKO)
r = rankMatrix(cellCycleKO$gl, N = cellCycleKO$N)



