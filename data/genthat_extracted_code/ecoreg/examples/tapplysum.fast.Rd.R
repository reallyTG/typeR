library(ecoreg)


### Name: tapplysum.fast
### Title: Simplified fast group sums
### Aliases: tapplysum.fast
### Keywords: manip

### ** Examples

x <- factor(rep(1:1000, each=100))
y <- rnorm(1000*100)
system.time(tapply(y, x, sum))
system.time(tapplysum.fast(y, x))



