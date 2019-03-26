library(ump)


### Name: arpv.plot
### Title: Plot Abstract Randomized P-value
### Aliases: arpv.plot
### Keywords: htest

### ** Examples

out <- arpv.binom(10, 10, 0.7)
arpv.plot(out$alpha, out$phi)
arpv.plot(out$alpha, out$phi, df = FALSE)



