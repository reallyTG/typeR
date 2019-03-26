library(metafolio)


### Name: fit_ricker
### Title: Fit Ricker linear regression
### Aliases: fit_ricker

### ** Examples

S <- seq(100, 1000, length.out = 100)
v_t <- rnorm(100, 0, 0.1)
R <- mapply(ricker_v_t, spawners = S, v_t = v_t, a = 1.9, b = 900, d = 1)
plot(S, log(R/S))
fit_ricker(S, R)



