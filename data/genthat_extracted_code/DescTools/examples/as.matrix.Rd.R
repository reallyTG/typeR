library(DescTools)


### Name: as.matrix.xtabs
### Title: Convert xtabs To matrix
### Aliases: as.matrix.xtabs
### Keywords: manipulate

### ** Examples

tab <- xtabs( ~ driver + operator, data=d.pizza)

str(tab)
class(tab)

str(as.matrix(tab))
class(as.matrix(tab))



