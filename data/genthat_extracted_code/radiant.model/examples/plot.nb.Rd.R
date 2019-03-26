library(radiant.model)


### Name: plot.nb
### Title: Plot method for the nb function
### Aliases: plot.nb

### ** Examples

result <- nb(titanic, "survived", c("pclass", "sex"))
plot(result)
result <- nb(titanic, "pclass", c("sex", "age"))
plot(result)




