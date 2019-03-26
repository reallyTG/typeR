library(fGarch)


### Name: std
### Title: Student-t Distribution
### Aliases: std dstd pstd qstd rstd
### Keywords: distribution

### ** Examples

## std -
   par(mfrow = c(2, 2))
   set.seed(1953)
   r = rstd(n = 1000)
   plot(r, type = "l", main = "sstd", col = "steelblue")
   
   # Plot empirical density and compare with true density:
   hist(r, n = 25, probability = TRUE, border = "white", col = "steelblue")
   box()
   x = seq(min(r), max(r), length = 201)
   lines(x, dstd(x), lwd = 2)
   
   # Plot df and compare with true df:
   plot(sort(r), (1:1000/1000), main = "Probability", col = "steelblue",
     ylab = "Probability")
   lines(x, pstd(x), lwd = 2)
   
   # Compute quantiles:
   round(qstd(pstd(q = seq(-1, 5, by = 1))), digits = 6)



