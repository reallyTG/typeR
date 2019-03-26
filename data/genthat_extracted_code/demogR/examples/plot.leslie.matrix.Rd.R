library(demogR)


### Name: plot.leslie.matrix
### Title: plot.leslie.matrix
### Aliases: plot.leslie.matrix
### Keywords: array algebra

### ** Examples

data(goodman)
ven <- with(goodman, life.table(x=age, nKx=ven.nKx, nDx=ven.nDx))
ven.mx <- with(goodman, ven.bx/ven.nKx)
A <- leslie.matrix(lx=ven$nLx,mx=ven.mx)
ea.ven <- eigen.analysis(A)

usa <- with(goodman, life.table(x=age, nKx=usa.nKx, nDx=usa.nDx))
usa.mx <- with(goodman, usa.bx/usa.nKx)
B <- leslie.matrix(lx=usa$nLx,mx=usa.mx)
ea.usa <- eigen.analysis(B)

## Compare sensitivities for Venezuela and the USA

plot(ea.ven$sens, main="Venezuela")
plot(ea.usa$sens, main="USA")



