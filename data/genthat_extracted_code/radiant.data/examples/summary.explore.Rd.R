library(radiant.data)


### Name: summary.explore
### Title: Summary method for the explore function
### Aliases: summary.explore

### ** Examples

result <- explore(diamonds, "price:x")
summary(result)
result <- explore(diamonds, "price", byvar = "cut", fun = c("n_obs", "skew"))
summary(result)
explore(diamonds, "price:x", byvar = "color") %>% summary()




