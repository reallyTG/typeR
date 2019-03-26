library(listarrays)


### Name: shuffle_rows
### Title: Shuffle along the first dimension multiple arrays in sync
### Aliases: shuffle_rows

### ** Examples

x <- 1:3
y <- matrix(1:9, ncol = 3)
z <- array(1:27, c(3,3,3))

if(require(zeallot)) {
  c(xs, ys, zs) %<-% shuffle_rows(x, y, z)

  l <- lapply(seq_along_rows(y), function(r) {
    list(x = x[r], y = y[r,], z = z[r,,])
  })

  ls <- lapply(seq_along_rows(y), function(r) {
    list(x = xs[r], y = ys[r,], z = zs[r,,])
  })

  stopifnot(
    length(unique(c(l, ls))) == length(l))
}



