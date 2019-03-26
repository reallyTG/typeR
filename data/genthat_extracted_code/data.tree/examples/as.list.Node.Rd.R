library(data.tree)


### Name: as.list.Node
### Title: Convert a 'data.tree' structure to a list-of-list structure
### Aliases: as.list.Node ToListSimple ToListExplicit

### ** Examples

data(acme)

str(ToListSimple(acme))
str(ToListSimple(acme, keepOnly = "cost"))

str(ToListExplicit(acme))
str(ToListExplicit(acme, unname = TRUE))
str(ToListExplicit(acme, unname = TRUE, nameName = "id", childrenName = "descendants"))





