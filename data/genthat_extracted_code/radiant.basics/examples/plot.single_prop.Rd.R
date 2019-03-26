library(radiant.basics)


### Name: plot.single_prop
### Title: Plot method for the single_prop function
### Aliases: plot.single_prop

### ** Examples

result <- single_prop(titanic, "survived", lev = "Yes", comp_value = 0.5,  alternative = "less")
plot(result, plots = c("bar", "simulate"))




