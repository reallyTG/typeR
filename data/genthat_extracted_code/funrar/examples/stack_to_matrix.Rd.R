library(funrar)


### Name: stack_to_matrix
### Title: Stacked (= tidy) data.frame to matrix
### Aliases: stack_to_matrix tidy_to_matrix

### ** Examples

example = data.frame("sites" = c(rep("1", 3), rep("2", 2)),
 "species" = c("A", "B", "C", "B", "D"),
  "abundance" = c(0.33, 0.33, 0.33, 0.4, 0.6))

mat = stack_to_matrix(example, "sites", "species", "abundance")
mat




