library(DstarM)


### Name: normalize
### Title: Normalize two pdfs
### Aliases: normalize

### ** Examples

tt <- seq(0, 9, length.out = 1e4)
# 2 poper densities
x1 <- cbind(dexp(tt, .5), dexp(tt, 2))
# still 2 poper densities
x2 <- normalize(10*x1, tt)
# 2 densities that integrate to .5
x3 <- normalize(x1, tt, props = c(.5, .5))
# plot the results
matplot(tt, cbind(x1, x2, x3), type = "l", ylab = "density",
        col = rep(1:3, each = 2), lty = rep(1:2, 3), las = 1, bty = "n")
legend("topright", legend = rep(paste0("x", 1:3), each = 2),
       col = rep(1:3, each = 2), lty = rep(1:2, 3), bty = "n")



