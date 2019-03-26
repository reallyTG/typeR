library(tolerance)


### Name: zm.ll
### Title: Maximum Likelihood Estimation for Zipf-Mandelbrot Models
### Aliases: zm.ll
### Keywords: file

### ** Examples

## Maximum likelihood estimation for randomly generated data
## from the Zipf, Zipf-Mandelbrot, and zeta distributions. 

set.seed(100)

s <- 2
b <- 5
N <- 50

zipf.data <- rzipfman(n = 500, s = s, N = N)
out.zipf <- zm.ll(zipf.data, N = N, dist = "Zipf")
stats4::coef(out.zipf)
stats4::vcov(out.zipf)

zipfman.data <- rzipfman(n = 500, s = s, b = b, N = N)
out.zipfman <- zm.ll(zipfman.data, N = N, dist = "Zipf-Man")
stats4::coef(out.zipfman)
diag(stats4::vcov(out.zipfman))

zeta.data <- rzipfman(n = 200, s = s, N = Inf)
out.zeta <- zm.ll(zeta.data, N = Inf, dist = "Zeta")
stats4::coef(out.zeta)
stats4::vcov(out.zeta)



