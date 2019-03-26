library(ggdag)


### Name: Pathways
### Title: Find Pathways Between Variables
### Aliases: Pathways dag_paths ggdag_paths ggdag_paths_fan

### ** Examples

confounder_triangle(x_y_associated = TRUE) %>%
  ggdag_paths(from = "x", to = "y")




