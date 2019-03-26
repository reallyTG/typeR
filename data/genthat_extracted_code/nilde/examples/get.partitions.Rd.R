library(nilde)


### Name: get.partitions
### Title: Additive partitioning of natural numbers
### Aliases: get.partitions

### ** Examples

## getting all partitions of n = 8 on at most 6 parts...
get.partitions(8,6,at.most=TRUE)

## getting all partitions of n = 8 on exactly 6 parts...
b <- get.partitions(8,6,at.most=FALSE)
b
colSums(b$partitions)




