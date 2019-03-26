library(logcondens)


### Name: brightstar
### Title: Bright star dataset used to illustrate log-concave density
###   estimation
### Aliases: brightstar
### Keywords: datasets

### ** Examples

# ---- load rotational velocity data ----
data(brightstar)

# ---- compute and plot log-concave estimate ----
# See also Figure 3 in Koenker & Mizera (2009)
x0 <- sort(brightstar[, 3])
res <- logConDens(x0, print = FALSE, smoothed = FALSE)
plot(res, which = "density")



