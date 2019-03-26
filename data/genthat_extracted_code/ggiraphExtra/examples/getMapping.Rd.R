library(ggiraphExtra)


### Name: getMapping
### Title: extract variable name from mapping, aes
### Aliases: getMapping

### ** Examples

require(ggplot2)
mapping=aes(colour=sex)
mapping=aes(x=c(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width))
getMapping(mapping,"colour")
getMapping(mapping,"x")



