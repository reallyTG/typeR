library(kernelboot)


### Name: rmvg
### Title: Random generation from multivariate Gaussian kernel density
### Aliases: rmvg

### ** Examples


set.seed(1)

dat <- mtcars[, c(1,3)]
bw <- bw.silv(dat)
X <- rmvg(5000, dat, bw = bw)

if (requireNamespace("ks", quietly = TRUE)) {

   pal <- colorRampPalette(c("chartreuse4", "yellow", "orange", "brown"))
   col <- pal(10)[cut(ks::kde(dat, H = bw, eval.points = X)$estimate, breaks = 10)]

   plot(X, col = col, pch = 19, axes = FALSE,
        main = "Multivariate Gaussian Kernel")
   points(dat, pch = 2, col = "blue")
   axis(1); axis(2)

} else {

   plot(X, pch = 16, axes = FALSE, col = "#458B004D",
        main = "Multivariate Gaussian Kernel")
   points(dat, pch = 2, col = "red", lwd = 2)
   axis(1); axis(2)

}





