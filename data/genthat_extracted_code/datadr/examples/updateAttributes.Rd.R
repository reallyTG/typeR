library(datadr)


### Name: updateAttributes
### Title: Update Attributes of a 'ddo' or 'ddf' Object
### Aliases: updateAttributes

### ** Examples

d <- divide(iris, by = "Species")
# some attributes are missing:
d
summary(d)
d <- updateAttributes(d)
# now all attributes are available:
d
summary(d)



