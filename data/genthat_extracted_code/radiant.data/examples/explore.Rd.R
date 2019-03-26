library(radiant.data)


### Name: explore
### Title: Explore and summarize data
### Aliases: explore

### ** Examples

explore(diamonds, c("price", "carat")) %>% str()
explore(diamonds, "price:x")$tab
explore(diamonds, c("price","carat"), byvar = "cut", fun = c("n_missing", "skew"))$tab




