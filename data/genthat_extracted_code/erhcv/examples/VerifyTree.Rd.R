library(erhcv)


### Name: VerifyTree
### Title: Verify tree structure
### Aliases: VerifyTree

### ** Examples

require(HAC)
str <- hac(type = 1, tree = list(list(list("X4", "X5", 6),
                                      "X6", 3), "X1", list("X2", "X3", 10), 1))

set.seed(2018)
U.. <- rHAC(1000, str)
U.. <- U..[,c(4, 5, 6, 1, 2, 3)]

## Tree via hclust
spear <- cor(U.., method = "sp")
clust <- hclust(dist(spear, method = "maximum"),
                method = "complete")
tree1 <- hclust2tree(clust)

## Tree after verification
tree2 <- VerifyTree(U.., alpha = 0.95,
                    distance.method = "maximum",
                    hclust.method = "complete")$Tree

## Comparison
par(mfrow = c(1, 3))
tree2plot(tree1)
tree2plot(tree2)
plot(str)
par(mfrow = c(1, 3))




