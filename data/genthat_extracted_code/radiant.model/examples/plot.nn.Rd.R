library(radiant.model)


### Name: plot.nn
### Title: Plot method for the nn function
### Aliases: plot.nn

### ** Examples

result <- nn(titanic, "survived", c("pclass", "sex"), lev = "Yes")
plot(result, plots = "net")
plot(result, plots = "olden")




