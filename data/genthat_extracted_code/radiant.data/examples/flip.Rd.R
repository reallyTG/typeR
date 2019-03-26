library(radiant.data)


### Name: flip
### Title: Flip the DT table to put Function, Variable, or Group by on top
### Aliases: flip

### ** Examples

explore(diamonds, "price:x", top = "var") %>% summary()
explore(diamonds, "price", byvar = "cut", fun = c("n_obs", "skew"), top = "byvar") %>% summary()




