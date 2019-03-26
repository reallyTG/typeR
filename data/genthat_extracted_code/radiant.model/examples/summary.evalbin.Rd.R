library(radiant.model)


### Name: summary.evalbin
### Title: Summary method for the evalbin function
### Aliases: summary.evalbin

### ** Examples

data.frame(buy = dvd$buy, pred1 = runif(20000), pred2 = ifelse(dvd$buy == "yes", 1, 0)) %>%
  evalbin(c("pred1", "pred2"), "buy") %>%
  summary()




