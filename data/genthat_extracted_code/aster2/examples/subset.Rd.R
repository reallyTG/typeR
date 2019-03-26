library(aster2)


### Name: subset.asterdata
### Title: Subset Object Describing Saturated Aster Model
### Aliases: subset.asterdata
### Keywords: manip

### ** Examples

data(echinacea)
#### select one individual from each level of pop
foo <- echinacea$redata$pop
bar <- match(levels(foo), as.character(foo))
baz <- is.element(echinacea$redata$id, echinacea$redata$id[bar])
out <- subset(echinacea, baz)



