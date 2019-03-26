library(Benchmarking)


### Name: make.merge
### Title: Make an aggregation matrix to perform mergers
### Aliases: make.merge

### ** Examples

# To merge firms 1,3, and 5; and 2 and 4 of 7 firms into 2 new firms
# the aggregation matrix is M; not all firms are involved in a merger.
M <- make.merge(list(c(1,3,5), c(2,4)),7)
print(M)

# Merge 1 and 2, and 4 and 5, and leave 3 alone, total of 5 firms.
# Using a list
M1 <- make.merge(list(c(1,2), c(4,5)), nFirm=5)
print(M1)

# Using a factor
fgr <- factor(c("en","en",NA,"to","to"))
M2 <- make.merge(fgr)
print(M2)

# Name of mergers
M3 <- make.merge(list(AB=c("A","B"), DE=c("D","E")), names=LETTERS[1:5])
print(M3)

# No name of mergers
M4 <- make.merge(list(c("A","B"), c("D","E")), names=LETTERS[1:5])
print(M4)



