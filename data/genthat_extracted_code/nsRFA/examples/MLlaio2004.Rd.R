library(nsRFA)


### Name: MLlaio2004
### Title: Maximum likelihood parameters estimation
### Aliases: MLlaio2004 ML_estimation moment_estimation
### Keywords: htest

### ** Examples

# sample from an EV1 distribution
sm <- rand.gumb(100, 0, 1)
moment_estimation (sm, dist="GEV")
ML_estimation (sm, dist="GEV")

F.GEV(sm, -0.051, 0.97, -0.024)
rand.GEV (100, -0.051, 0.97, -0.024)
moment_estimation (sm, dist="P3")
ML_estimation (sm, dist="P3")



