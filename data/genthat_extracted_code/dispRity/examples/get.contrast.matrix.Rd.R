library(dispRity)


### Name: get.contrast.matrix
### Title: Generates a contrast matrix.
### Aliases: get.contrast.matrix

### ** Examples

## A random multistate matrix
random_matrix <- matrix(sample(c(0,1,2), 100, TRUE), 10, 10)

## Get the contrast matrix
get.contrast.matrix(random_matrix)

## Adding inapplicable and missing data to the matrix
random_matrix[sample(1:100, 10)] <- "?"
random_matrix[sample(1:100, 10)] <- "-"

## Get the contrast matrix
get.contrast.matrix(random_matrix)




