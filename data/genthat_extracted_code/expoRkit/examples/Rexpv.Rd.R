library(expoRkit)


### Name: Rexpv
### Title: Expokit __EXPV and __PHIV wrapper.
### Aliases: Rexpv

### ** Examples

### A CCS 4 by 4 real matrix. The last element in 'ja' is the number of
### non-zero elements + 1.
a <- c(-1, 1, -2, -3, 1, 2, -1)
ia <- c(1, 3, 2, 4, 1, 2, 3)
ja <- c(1, 3, 5, 6, 8)

v <- c(1, 1, 1, 1)
wCCS <- expoRkit:::Rexpv(a, ia, ja, 4, v = v)

### COO storage instead.
ja <- c(1, 1, 2, 2, 3, 4, 4)
wCOO <- expoRkit:::Rexpv(a, ia, ja, 4, v = v, storage = 'COO')

### CRS storage instead.
a <- c(-1, 1, -2, 2, 1, -1, -3)
ja <- c(1, 3, 2, 4, 1, 4, 2)
ia <- c(1, 3, 5, 7, 8)
wCRS <- expoRkit:::Rexpv(a, ia, ja, 4, v = v, storage = 'CRS')

cbind(wCCS, wCOO, wCRS)

stopifnot(all.equal(wCCS, wCOO),
          all.equal(wCCS, wCRS),
          all.equal(wCRS, wCOO))

## Complex version
a <- c(-1, 1i, -2, -3i, 1, 2i, -1)
ia <- c(1, 3, 2, 4, 1, 2, 3)
ja <- c(1, 3, 5, 6, 8)

v <- c(1, 1, 1, 1)
wCCS <- expoRkit:::Rexpv(a, ia, ja, 4, v = v)

### COO storage instead.
ja <- c(1, 1, 2, 2, 3, 4, 4)
wCOO <- expoRkit:::Rexpv(a, ia, ja, 4, v = v, storage = 'COO')

### CRS storage instead.
a <- c(-1, 1, -2, 2i, 1i, -1, -3i)
ja <- c(1, 3, 2, 4, 1, 4, 2)
ia <- c(1, 3, 5, 7, 8)
wCRS <- expoRkit:::Rexpv(a, ia, ja, 4, v = v, storage = 'CRS')

cbind(wCCS, wCOO, wCRS)

stopifnot(all.equal(wCCS, wCOO),
          all.equal(wCCS, wCRS),
          all.equal(wCRS, wCOO))



