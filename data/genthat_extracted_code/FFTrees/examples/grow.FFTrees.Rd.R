library(FFTrees)


### Name: grow.FFTrees
### Title: Grows fast-and-frugal trees using an algorithm specified by
###   'algorithm'.
### Aliases: grow.FFTrees

### ** Examples


 titanic.trees <- grow.FFTrees(formula = survived ~.,
                               data = titanic)

# Tree definitions are stored in tree.definitions

titanic.trees$tree.definitions

# Tree classification statistics are in tree.stats

titanic.trees$tree.stats

# The level at which each exemplar is classified for each tree is in levelout

titanic.trees$levelout

# The decision for each exemplar for each tree is in decision

titanic.trees$decision






