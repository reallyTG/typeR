library(igraph)


### Name: centr_degree_tmax
### Title: Theoretical maximum for degree centralization
### Aliases: centr_degree_tmax centralization.degree.tmax

### ** Examples

# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g, normalized = FALSE)$centralization %>%
 `/`(centr_degree_tmax(g))
centr_degree(g, normalized = TRUE)$centralization



