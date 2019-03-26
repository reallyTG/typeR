library(cobs)


### Name: plot.cobs
### Title: Plot Method for COBS Objects
### Aliases: plot.cobs
### Keywords: print

### ** Examples

example(cobs)

plot(Sbs)
plot(fitted(Sbs), resid(Sbs),
     main = "Tukey-Anscombe plot for cobs()",
     sub = deparse(Sbs$call))



