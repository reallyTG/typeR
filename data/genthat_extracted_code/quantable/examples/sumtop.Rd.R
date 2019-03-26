library(quantable)


### Name: sumtop
### Title: sums top rows of matrix uses median of row to determine row
###   order
### Aliases: sumtop

### ** Examples

tmp <- rbind(rep(1,times = 4), rep(2,times=4), rep(3,times=4), rep(4,times=4))
res <- sumtop(tmp)
stopifnot(res == c(9,9,9,9))




