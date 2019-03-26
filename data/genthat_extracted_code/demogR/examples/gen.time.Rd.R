library(demogR)


### Name: gen.time
### Title: gen.time
### Aliases: gen.time
### Keywords: array algebra

### ** Examples


## compare generation times from two populations with very different
## R_0 values
data(goodman)
ven <- with(goodman, life.table(x=age, nKx=ven.nKx, nDx=ven.nDx))
ven.mx <- with(goodman, ven.bx/ven.nKx)
A <- leslie.matrix(lx=ven$nLx,mx=ven.mx)

usa <- with(goodman, life.table(x=age, nKx=usa.nKx, nDx=usa.nDx))
usa.mx <- with(goodman, usa.bx/usa.nKx)
B <- leslie.matrix(lx=usa$nLx,mx=usa.mx)

gen.time(A)
gen.time(B)



