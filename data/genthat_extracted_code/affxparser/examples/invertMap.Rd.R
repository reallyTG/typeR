library(affxparser)


### Name: invertMap
### Title: Inverts a read or a write map
### Aliases: invertMap
### Keywords: file IO internal

### ** Examples

set.seed(1)

# Simulate a read map for a chip with 1.2 million cells
nbrOfCells <- 1200000
readMap <- sample(nbrOfCells)

# Get the corresponding write map
writeMap <- invertMap(readMap)

# A map inverted twice should be equal itself
stopifnot(identical(invertMap(writeMap), readMap))

# Another example illustrating that the write map is the
# inverse of the read map
idx <- sample(nbrOfCells, size=1000)
stopifnot(identical(writeMap[readMap[idx]], idx))

# invertMap() is much faster than order()
t1 <- system.time(invertMap(readMap))[3]
cat(sprintf("invertMap()  : %5.2fs [ 1.00x]\n", t1))

t2 <- system.time(writeMap2 <- sort.list(readMap, na.last=NA, method="quick"))[3]
cat(sprintf("'quick sort' : %5.2fs [%5.2fx]\n", t2, t2/t1))
stopifnot(identical(writeMap, writeMap2))

t3 <- system.time(writeMap2 <- order(readMap))[3]
cat(sprintf("order()      : %5.2fs [%5.2fx]\n", t3, t3/t1))
stopifnot(identical(writeMap, writeMap2))

# Clean up
rm(nbrOfCells, idx, readMap, writeMap, writeMap2)




