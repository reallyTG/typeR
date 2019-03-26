library(radiant.multivariate)


### Name: summary.prmap
### Title: Summary method for the prmap function
### Aliases: summary.prmap

### ** Examples

result <- prmap(computer, brand = "brand", attr = "high_end:business")
summary(result)
summary(result, cutoff = .3)
prmap(
  computer, brand = "brand", attr = "high_end:dated",
  pref = c("innovative","business")
) %>% summary()




