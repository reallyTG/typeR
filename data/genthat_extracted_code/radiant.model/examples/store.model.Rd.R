library(radiant.model)


### Name: store.model
### Title: Store residuals from a model
### Aliases: store.model

### ** Examples

regress(diamonds, rvar = "price", evar = c("carat", "cut"), data_filter = "price > 1000") %>%
  store(diamonds, ., name = "resid") %>%
  head()




