library(igraph)


### Name: centr_betw_tmax
### Title: Theoretical maximum for betweenness centralization
### Aliases: centr_betw_tmax centralization.betweenness.tmax

### ** Examples

# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_betw(g, normalized = FALSE)$centralization %>%
 `/`(centr_betw_tmax(g))
centr_betw(g, normalized = TRUE)$centralization



