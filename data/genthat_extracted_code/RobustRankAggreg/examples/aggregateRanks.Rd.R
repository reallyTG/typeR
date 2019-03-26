library(RobustRankAggreg)


### Name: aggregateRanks
### Title: Aggregate ranked lists
### Aliases: RobustRankAggreg aggregateRanks

### ** Examples

# Make sample input data
glist <- list(sample(letters, 4), sample(letters, 10), sample(letters, 12))

# Aggregate the inputs
aggregateRanks(glist = glist, N = length(letters))
aggregateRanks(glist = glist, N = length(letters), method = "stuart")

# Since we know the cutoffs for the lists in advance (4, 10, 12) we can use
# the more accurate algorithm with parameter topCutoff

# Use the rank matrix instead of the gene lists as the input
r = rankMatrix(glist)

aggregateRanks(rmat = r)

# Example, when the input lists represent full rankings but the domains do not match
glist <- list(sample(letters[4:24]), sample(letters[2:22]), sample(letters[1:20]))
r = rankMatrix(glist, full = TRUE)
head(r)

aggregateRanks(rmat = r, method = "RRA")

# Dataset representing significantly changed genes after knockouts
# of cell cycle specific trancription factors
data(cellCycleKO)
r = rankMatrix(cellCycleKO$gl, N = cellCycleKO$N)
ar = aggregateRanks(rmat = r)
head(ar)



