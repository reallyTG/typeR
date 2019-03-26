library(kolmim)


### Name: ks.test.imp
### Title: Kolmogorov-Smirnov Tests
### Aliases: ks.test.imp
### Keywords: htest

### ** Examples

x <- abs(rnorm(100))
p.kt <- ks.test(x, "pexp", exact = TRUE)$p
p.ktimp <- ks.test.imp(x, "pexp")$p
abs(p.kt - p.ktimp)

# compare execution times
x <- abs(rnorm(2000))
system.time(ks.test.imp(x, "pexp"))
system.time(ks.test(x, "pexp", exact = TRUE))



