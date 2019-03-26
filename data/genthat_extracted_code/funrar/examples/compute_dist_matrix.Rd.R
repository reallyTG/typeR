library(funrar)


### Name: compute_dist_matrix
### Title: Functional Distance Matrix
### Aliases: compute_dist_matrix distance_matrix

### ** Examples

set.seed(1)  # For reproducibility
trait = data.frame(
   sp = paste("sp", 1:5),
   trait_1 = runif(5),
   trait_2 = as.factor(c("A", "A", "A", "B", "B")))

rownames(trait) = trait$sp

dist_mat = compute_dist_matrix(trait[, -1])




