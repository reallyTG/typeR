library(radiant.multivariate)


### Name: plot.prmap
### Title: Plot method for the prmap function
### Aliases: plot.prmap

### ** Examples

result <- prmap(computer, brand = "brand", attr = "high_end:business")
plot(result, plots = "brand")
plot(result, plots = c("brand", "attr"))
plot(result, scaling = 1, plots = c("brand", "attr"))
prmap(
  retailers, brand = "retailer",
  attr = "good_value:cluttered",
  pref = c("segment1", "segment2")
) %>% plot(plots = c("brand", "attr", "pref"))




