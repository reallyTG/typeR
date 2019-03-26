library(dispRity)


### Name: combine.subsets
### Title: Combines or cleans subsets.
### Aliases: combine.subsets

### ** Examples

## Generate subsets from a dummy matrix
dummy_matrix <- matrix(rnorm(120), 40)
dummy_subsets <- custom.subsets(dummy_matrix,
     group = list("a" = c(1:5), "b" = c(6:10), "c" = c(11:20),
                  "d" = c(21:24), "e" = c(25:30), "f" = c(31:40)))

## Merging the two first subsets
combine.subsets(dummy_subsets, c(1,2))

## Merging the three subsets by name
combine.subsets(dummy_subsets, c("d", "c", "e"))

## Merging the subsets to contain at least 20 taxa
combine.subsets(dummy_subsets, 10)




