library(sfsmisc)


### Name: inv.seq
### Title: Inverse seq() - Short Expression for Index Vector
### Aliases: inv.seq
### Keywords: arith utilities

### ** Examples

(rr <- inv.seq(i1 <- c(3:12, 20:24, 27, 30:33)))
eval(rr)
stopifnot(eval(rr) == i1)

e2 <- expression(c(20:13, 3:12, -1:-4, 27, 30:31))
(i2 <- eval(e2))
(r2 <- inv.seq(i2))
stopifnot(all.equal(r2, e2[[1]]))

## Had {mapply()} bug in this example:
ii <- c(1:3, 6:9, 11:16)
stopifnot(identical(ii, eval(inv.seq(ii))))



