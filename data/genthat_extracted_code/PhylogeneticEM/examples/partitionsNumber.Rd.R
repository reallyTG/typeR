library(PhylogeneticEM)


### Name: partitionsNumber
### Title: Number of different models
### Aliases: partitionsNumber

### ** Examples

npart <- 8 # number of colors at the tips allowed
tree <- read.tree(text="(A,(A,(A,A,A),A,A));") # a tree with polytomies
plot(tree)
parts_num <- partitionsNumber(tree, npart)
parts_num

## Number of possible colorings of the tips in npart colors
extract(parts_num)

## Get all the solutions for colorings with 1 to nparts colors
extract(parts_num, npart = 1:npart)

## Number of possible colorings of the tips in npart colors
## For the sub-tree starting at node 17
extract(parts_num, node = 10)

## Number of possible colorings of the tips in npart colors
## with one marked color
extract(parts_num, marked = TRUE)





