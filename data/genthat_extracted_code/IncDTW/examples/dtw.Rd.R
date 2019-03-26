library(IncDTW)


### Name: dtw
### Title: Dynamic Time Warping
### Aliases: dtw cm
### Keywords: cluster ts

### ** Examples

# multivariate
Q <- matrix(rnorm(100), ncol=2)
C <- matrix(rnorm(80), ncol=2)
tmp <- dtw(Q = Q, C = C, ws = 30)


# univariate
Q <- cumsum(rnorm(100))
C <- Q[11:100] + rnorm(90, 0, 0.5)
tmp <- dtw(Q = Q, C = C, ws = 15, return_diffM = FALSE)
names(tmp)
tmp$distance



# compare different input variations
dtw_base <- dtw(Q = Q, C = C, ws = 15, return_diffM = TRUE)
dtw_diffM <- dtw(Q = dtw_base$diffM, C = "diffM", ws = 15, return_diffM = TRUE)
dtw_cm <- dtw(Q = abs(dtw_base$diffM), C = "cm", ws = 15, return_diffM = TRUE)

identical(dtw_base$gcm, dtw_cm$gcm)
identical(dtw_base$gcm, dtw_diffM$gcm)

# of course no diffM is returned in the 'cm'-case
dtw_cm$diffM

# multivariate case
Q <- matrix(rnorm(100), ncol=2)
C <- matrix(rnorm(80), ncol=2)
dtw(Q = Q, C = C, ws = 30, dist_method = "norm2")



