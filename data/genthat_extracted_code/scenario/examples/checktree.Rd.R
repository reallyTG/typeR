library(scenario)


### Name: checktree
### Title: Check the tree structure implied by a scenario tree nodal
###   partition matrix.
### Aliases: checktree

### ** Examples

treeStruct <- rbind(c(1, 1, 1, 1, 1),
                    c(2, 2, 7, 7, 11),
                    c(3, 5, 8, 8, 12),
                    c(4, 6, 9, 10, 13)
                    )
checktree(treeStruct)



