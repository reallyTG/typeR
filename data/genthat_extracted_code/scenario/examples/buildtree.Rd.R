library(scenario)


### Name: buildtree
### Title: Build a scenario tree with a predefined nodal structure.
### Aliases: buildtree

### ** Examples

# Generate some 25 random realizations of length 4 and reduce to scenario tree.
scenarios <- matrix(rnorm(100),ncol=25)
treeStruct <- rbind(c(1, 1, 1, 1, 1),
                    c(2, 2, 7, 7, 11),
                    c(3, 5, 8, 8, 12),
                    c(4, 6, 9, 10, 13)
                    )
tree <- buildtree(scenarios, treeStruct, jMax = 1000)



