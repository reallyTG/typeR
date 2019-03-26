library(radiant.model)


### Name: summary.confusion
### Title: Summary method for the confusion matrix
### Aliases: summary.confusion

### ** Examples

data.frame(buy = dvd$buy, pred1 = runif(20000), pred2 = ifelse(dvd$buy == "yes", 1, 0)) %>%
  confusion(c("pred1", "pred2"), "buy") %>%
  summary()




