library(dispRity)


### Name: crown.stem
### Title: Separates stem and crown species
### Aliases: crown.stem

### ** Examples

## A tree with fossil taxa
data(BeckLee_tree)

## Getting both crown and stem taxa lists
crown.stem(BeckLee_tree)

## Splitting the tree into two subtrees
crown_stem_trees <- crown.stem(BeckLee_tree, output.names = FALSE)
## Graphical parameters
op <- par(mfrow = c(1,3))
## Plotting the trees
plot(BeckLee_tree, main = "Full tree")
plot(crown_stem_trees$crown, main = "Crown group")
plot(crown_stem_trees$stem, main = "Stem group")




