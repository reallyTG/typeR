library(snpar)


### Name: cs.test
### Title: Cox-Stuart Trend Test
### Aliases: cs.test
### Keywords: cstest

### ** Examples

x <- 0.5*c(1:100) + rnorm(100,2,20)
# exact method
cs.test(x)
# approximate method
cs.test(x, exact = FALSE)



