library(dispRity)


### Name: check.morpho
### Title: Check a morphological matrix consistency levels.
### Aliases: check.morpho

### ** Examples

## Generating a random tree
random_tree <- rcoal(10)

## Generating a random matrix
random_matrix <- sim.morpho(random_tree, characters = 50, model = "ER",
     rates = c(rgamma, 1, 1))

## Checking the matrix scores
check.morpho(random_matrix, orig.tree = random_tree)




