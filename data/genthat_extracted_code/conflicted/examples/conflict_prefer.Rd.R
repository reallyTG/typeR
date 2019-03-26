library(conflicted)


### Name: conflict_prefer
### Title: Persistently prefer one function over another
### Aliases: conflict_prefer

### ** Examples

# Prefer over all other packages
conflict_prefer("filter", "dplyr")

# Prefer over specified package or packages
conflict_prefer("filter", "dplyr", "base")
conflict_prefer("filter", "dplyr", c("base", "filtration"))



