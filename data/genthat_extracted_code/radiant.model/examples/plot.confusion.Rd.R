library(radiant.model)


### Name: plot.confusion
### Title: Plot method for the confusion matrix
### Aliases: plot.confusion

### ** Examples

data.frame(buy = dvd$buy, pred1 = runif(20000), pred2 = ifelse(dvd$buy == "yes", 1, 0)) %>%
  confusion(c("pred1", "pred2"), "buy") %>%
  plot()




