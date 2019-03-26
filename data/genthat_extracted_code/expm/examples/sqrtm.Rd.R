library(expm)


### Name: sqrtm
### Title: Matrix Square Root
### Aliases: sqrtm
### Keywords: algebra math

### ** Examples

m <- diag(2)
sqrtm(m) == m # TRUE

(m <- rbind(cbind(1, diag(1:3)),2))
sm <- sqrtm(m)
sm
zapsmall(sm %*% sm) # Zap entries ~= 2e-16
stopifnot(all.equal(m, sm %*% sm))



