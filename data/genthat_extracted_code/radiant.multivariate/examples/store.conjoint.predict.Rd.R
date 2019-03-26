library(radiant.multivariate)


### Name: store.conjoint.predict
### Title: Store predicted values generated in predict.conjoint
### Aliases: store.conjoint.predict

### ** Examples

conjoint(mp3, rvar = "Rating", evar = "Memory:Shape") %>%
  predict(mp3) %>%
  store(mp3, ., name = "pred_pref")




