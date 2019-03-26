library(opticut)


### Name: allComb
### Title: Finding All Possible Binary Partitions
### Aliases: allComb kComb checkComb
### Keywords: manip misc

### ** Examples

kComb(k = 2)
kComb(k = 3)
kComb(k = 4)

## finding all combinations
(f <- rep(LETTERS[1:4], each=2))
(mc <- allComb(f, collapse = "_"))
## checking for complementary entries
checkComb(mc) # TRUE
## adding complementary entries to the matrix
mc2 <- cbind(z = 1 - mc[,1], mc[,c(1:ncol(mc), 1)])
colnames(mc2) <- 1:ncol(mc2)
mc2
checkComb(mc2) # FALSE



