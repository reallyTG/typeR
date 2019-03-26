library(fGarch)


### Name: sged
### Title: Skew Generalized Error Distribution
### Aliases: sged dsged psged qsged rsged
### Keywords: distribution

### ** Examples

## sged -
   par(mfrow = c(2, 2))
   set.seed(1953)
   r = rsged(n = 1000)
   plot(r, type = "l", main = "sged", col = "steelblue")
   
   # Plot empirical density and compare with true density:
   hist(r, n = 25, probability = TRUE, border = "white", col = "steelblue")
   box()
   x = seq(min(r), max(r), length = 201)
   lines(x, dsged(x), lwd = 2)
   
   # Plot df and compare with true df:
   plot(sort(r), (1:1000/1000), main = "Probability", col = "steelblue",
     ylab = "Probability")
   lines(x, psged(x), lwd = 2)
   
   # Compute quantiles:
   round(qsged(psged(q = seq(-1, 5, by = 1))), digits = 6)



