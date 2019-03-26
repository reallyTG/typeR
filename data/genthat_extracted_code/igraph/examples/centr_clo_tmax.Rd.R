library(igraph)


### Name: centr_clo_tmax
### Title: Theoretical maximum for closeness centralization
### Aliases: centr_clo_tmax centralization.closeness.tmax

### ** Examples

# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_clo(g, normalized = FALSE)$centralization %>%
 `/`(centr_clo_tmax(g))
centr_clo(g, normalized = TRUE)$centralization



