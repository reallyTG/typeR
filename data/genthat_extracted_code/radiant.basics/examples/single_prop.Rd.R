library(radiant.basics)


### Name: single_prop
### Title: Compare a sample proportion to a population proportion
### Aliases: single_prop

### ** Examples

single_prop(titanic, "survived") %>% str()
single_prop(titanic, "survived", lev = "Yes", comp_value = 0.5,  alternative = "less") %>% str()




