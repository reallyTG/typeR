library(rcdd)


### Name: makeH
### Title: make H-representation of convex polyhedron
### Aliases: makeH addHeq addHin
### Keywords: misc

### ** Examples

d <- 4
# unit simplex in H-representation
qux <- makeH(- diag(d), rep(0, d), rep(1, d), 1)
print(qux)
# add an inequality constraint
qux <- addHin(c(1, -1, 0, 0), 0, qux)
print(qux)
# drop a constraint
qux <- qux[- 3, ]
print(qux)



