library(radiant.data)


### Name: dtab.explore
### Title: Make an interactive table of summary statistics
### Aliases: dtab.explore

### ** Examples

## Not run: 
##D tab <- explore(diamonds, "price:x") %>% dtab()
##D tab <- explore(diamonds, "price", byvar = "cut", fun = c("n_obs", "skew"), top = "byvar") %>%
##D   dtab()
## End(Not run)




