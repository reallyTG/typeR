library(radiant.multivariate)


### Name: store.kclus
### Title: Add a cluster membership variable to the active dataset
### Aliases: store.kclus

### ** Examples

kclus(shopping, vars = "v1:v6", nr_clus = 3) %>%
  store(shopping, .) %>%
  head()




