library(IncDTW)


### Name: dtw_partial
### Title: Partial Dynamic Time Warping
### Aliases: dtw_partial
### Keywords: cluster ts

### ** Examples

# open-end alignment for multivariate time series
# first simulate a 2-dim time series Q
Q <- matrix(cumsum(rnorm(100)), ncol=2)

# simulate C as noisy and warped version of Q, and append noise at the end
C <- Q[sort(sample(50, 40, replace=FALSE)), ] + rnorm(80)
C <- rbind(C, matrix(rnorm(30), ncol=2))

tmp <- dtw(Q = Q, C = C, ws = 30, return_QC = TRUE, return_wp = TRUE)
par <- dtw_partial(tmp, partial_C = TRUE)
par
plot(tmp, partial = par, type = "QC")
plot(tmp, partial = par, type = "warp")
plot(tmp, partial = par, type = "QC", selDim = 2)



# open-start is possible as well (open-end is the regular case) since DTW is reversible:
Q <- sin(1:100)
C <- c(rnorm(50), Q)
tmp <- dtw(Q = rev(Q), C = rev(C))
dtw_partial(tmp, reverse = TRUE)




