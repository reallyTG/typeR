library(radiant.model)


### Name: evalbin
### Title: Evaluate the performance of different (binary) classification
###   models
### Aliases: evalbin

### ** Examples

data.frame(buy = dvd$buy, pred1 = runif(20000), pred2 = ifelse(dvd$buy == "yes", 1, 0)) %>%
  evalbin(c("pred1", "pred2"), "buy") %>%
  str()




