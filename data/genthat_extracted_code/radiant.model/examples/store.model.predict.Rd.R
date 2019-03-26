library(radiant.model)


### Name: store.model.predict
### Title: Store predicted values generated in model functions
### Aliases: store.model.predict

### ** Examples

regress(diamonds, rvar = "price", evar = c("carat", "cut")) %>%
  predict(pred_data = diamonds) %>%
  store(diamonds, ., name = c("pred", "pred_low", "pred_high")) %>%
  head()




