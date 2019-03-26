library(NPCirc)


### Name: bw.boot
### Title: Bootstrap method
### Aliases: bw.boot
### Keywords: circular density

### ** Examples

set.seed(2012)
n <- 100
x <- rcircmix(n, model=17)
bw.boot(x, lower=0, upper=20)



