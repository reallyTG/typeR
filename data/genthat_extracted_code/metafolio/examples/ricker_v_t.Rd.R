library(metafolio)


### Name: ricker_v_t
### Title: Ricker stock-recruit function with specified error
### Aliases: ricker_v_t

### ** Examples

plot(1, 1, xlim = c(1, 100), ylim = c(0, 90), type = "n", xlab = "Spawners",
  ylab = "Returns")
for(i in 1:100) {
points(i, ricker_v_t(i, a = 1.1, b = 60, d = 1, v_t = rnorm(1, mean =
  -(0.1^2)/2, sd = 0.1)))
}



