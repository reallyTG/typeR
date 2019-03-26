library(rpca)


### Name: thresh.nuclear
### Title: Thresholding operator
### Aliases: thresh.nuclear
### Keywords: thresholding operator

### ** Examples

## The function is currently defined as
function (M, thr) {
    s <- La.svd.cmp(M)
    dd <- thresh.l1(s$d, thr)
    id <- which(dd != 0)
    s$d <- dd[id]
    s$u <- s$u[, id, drop = FALSE]
    s$vt <- s$vt[id, , drop = FALSE]
    s$L <- s$u %*% (s$d * s$vt)
    s
  }

l<-thresh.nuclear(matrix(runif(600),nrow=20),2)
l$d



