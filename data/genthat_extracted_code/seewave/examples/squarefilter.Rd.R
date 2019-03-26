library(seewave)


### Name: squarefilter
### Title: Frequency square filter
### Aliases: squarefilter
### Keywords: ts filter

### ** Examples

f <- 44100
a <- noisew(f = f, d = 1)
p <- squarefilter(f, from = c(100, 1000, 4000), to = c(500, 3000, 8000))
plot(p, type="l")
h <- fir(a, f = f, custom = p, wl = 1024, output = 'Wave')
spectro(h)



