library(relations)


### Name: transform
### Title: Transform incidences
### Aliases: transform_incidences
### Keywords: math

### ** Examples

require("sets")				# set(), pair() etc.
x <- relation(domain = c(1,2,3,4),
              graph = set(pair(1,2), pair(4,2), pair(1,3), pair(1,4),
                          pair(3,2), pair(2,1)))
inc <- relation_incidence(x)
print(inc)

transform_incidences(inc, to = "SO")
transform_incidences(inc, to = "01")
transform_incidences(inc, to = "-1+1")

## transformations should be loss-free:
inc2 <- transform_incidences(inc, from = "PO", to = "-1+1")
inc2 <- transform_incidences(inc2, from = "-1+1", to = "SO")
inc2 <- transform_incidences(inc2, from = "SO", to = "01")
inc2 <- transform_incidences(inc2, from = "01", to = "PO")
stopifnot(identical(inc, inc2))



