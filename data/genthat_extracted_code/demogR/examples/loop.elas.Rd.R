library(demogR)


### Name: loop.elas
### Title: loop.elas
### Aliases: loop.elas
### Keywords: array algebra

### ** Examples


data(goodman)
ven <- with(goodman, life.table(x=age, nKx=ven.nKx, nDx=ven.nDx))
ven.mx <- with(goodman, ven.bx/ven.nKx)
A <- leslie.matrix(lx=ven$nLx,mx=ven.mx)

usa <- with(goodman, life.table(x=age, nKx=usa.nKx, nDx=usa.nDx))
usa.mx <- with(goodman, usa.bx/usa.nKx)
B <- leslie.matrix(lx=usa$nLx,mx=usa.mx)

eav <- eigen.analysis(A)
eau <- eigen.analysis(B)

## Compare the loop elasticities of Venezuela (1965) and the USA (1967)
le.usa <- loop.elas(A)
le.usa <- loop.elas(B)





