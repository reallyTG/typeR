library(radiant.multivariate)


### Name: store.full_factor
### Title: Store factor scores to active dataset
### Aliases: store.full_factor

### ** Examples

full_factor(shopping, "v1:v6", nr_fact = 3) %>%
  store(shopping, .) %>%
  head()




