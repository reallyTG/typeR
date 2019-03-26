library(tolerance)


### Name: zipftol.int
### Title: Zipf-Mandelbrot Tolerance Intervals
### Aliases: zipftol.int
### Keywords: file

### ** Examples

## 95%/99% 1-sided tolerance intervals for the Zipf, 
## Zipf-Mandelbrot, and zeta distributions. 

set.seed(100)

s <- 2
b <- 5
N <- 50

zipf.data <- rzipfman(n = 150, s = s, N = N)
zipfman.data <- rzipfman(n = 150, s = s, b = b, N = N)
zeta.data <- rzipfman(n = 150, s = s, N = Inf)

out.zipf <- zipftol.int(zipf.data, dist = "Zipf")
out.zipfman <- zipftol.int(zipfman.data, dist = "Zipf-Man")
out.zeta <- zipftol.int(zeta.data, N = Inf, dist = "Zeta")

out.zipf
out.zipfman
out.zeta



