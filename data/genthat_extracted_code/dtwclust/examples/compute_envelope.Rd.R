library(dtwclust)


### Name: compute_envelope
### Title: Time series warping envelopes
### Aliases: compute_envelope

### ** Examples


data(uciCT)

H <- compute_envelope(CharTraj[[1L]], 18L)

matplot(do.call(cbind, H), type = "l", col = 2:3)
lines(CharTraj[[1L]])




