library(moonBook)


### Name: getMapping
### Title: extract variable name from mapping, aes
### Aliases: getMapping

### ** Examples

require(ggplot2)
mapping=aes(colour=sex)
getMapping(mapping,"colour")
getMapping(mapping,"x")



