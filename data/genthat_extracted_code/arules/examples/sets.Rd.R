library(arules)


### Name: setOperations
### Title: Set Operations
### Aliases: setOperations sets union union-methods
###   union,associations,associations-method
###   union,itemMatrix,itemMatrix-method intersect intersect-methods
###   intersect,associations,associations-method
###   intersect,itemMatrix,itemMatrix-method setequal setequal-methods
###   setequal,associations,associations-method
###   setequal,itemMatrix,itemMatrix-method setdiff setdiff-methods
###   setdiff,associations,associations-method
###   setdiff,itemMatrix,itemMatrix-method is.element is.element-methods
###   is.element,associations,associations-method
###   is.element,itemMatrix,itemMatrix-method
### Keywords: manip

### ** Examples

data("Adult")

## mine some rules
r <- apriori(Adult)

## take 2 subsets
r1 <- r[1:10]
r2 <- r[6:15]

union(r1,r2)
intersect(r1,r2)
setequal(r1,r2)



