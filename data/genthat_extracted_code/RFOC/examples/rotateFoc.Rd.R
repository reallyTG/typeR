library(RFOC)


### Name: rotateFoc
### Title: Rotate Focal Mechanism
### Aliases: rotateFoc
### Keywords: misc

### ** Examples



a1 = SDRfoc(90, 90, 90, u = TRUE , PLOT = TRUE)


par(mfrow=c(2,2))

SDRfoc(a1$az1, a1$dip1, a1$rake1, u = TRUE, PLOT = TRUE)
ra1 = rotateFoc(a1, -90)

SDRfoc(ra1$az1, ra1$dip1, ra1$rake1, u = TRUE , PLOT = TRUE)

ra1 = rotateFoc(a1, 0)


SDRfoc(a1$az1, a1$dip1, a1$rake1, u = TRUE, PLOT = TRUE)

SDRfoc(ra1$az1, ra1$dip1, ra1$rake1, u = TRUE , PLOT = TRUE)








