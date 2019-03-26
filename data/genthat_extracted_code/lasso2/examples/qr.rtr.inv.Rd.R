library(lasso2)


### Name: qr.rtr.inv
### Title: Reconstruct the Inverse of R'R from a QR Object
### Aliases: qr.rtr.inv
### Keywords: algebra array

### ** Examples

(h3 <- 1/outer(0:5, 1:3, "+"))
rtr <- qr.rtr.inv(qr(h3))
all.equal(c(rtr %*% 1:3), solve(crossprod(h3), 1:3))



