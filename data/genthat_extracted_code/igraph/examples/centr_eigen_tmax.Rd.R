library(igraph)


### Name: centr_eigen_tmax
### Title: Theoretical maximum for betweenness centralization
### Aliases: centr_eigen_tmax centralization.evcent.tmax

### ** Examples

# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_eigen(g, normalized = FALSE)$centralization %>%
 `/`(centr_eigen_tmax(g))
centr_eigen(g, normalized = TRUE)$centralization



