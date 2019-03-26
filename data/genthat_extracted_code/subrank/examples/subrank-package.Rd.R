library(subrank)


### Name: subrank-package
### Title: Computes Copula using Ranks and Subsampling
### Aliases: subrank-package subrank

### ** Examples

lon <- 31
a <- 2.85
x <- rnorm(lon)
y = a*x^2+rnorm(lon)
tablo = as.data.frame(cbind(x,y))
c=corc(tablo,c(1,2),8)
desscop(c,1,2)



