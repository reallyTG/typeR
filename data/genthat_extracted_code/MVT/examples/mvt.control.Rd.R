library(MVT)


### Name: mvt.control
### Title: Set control parameters
### Aliases: mvt.control
### Keywords: models

### ** Examples

ctrl <- mvt.control(maxIter = 500, tol = 1e-04, fix.shape = TRUE)
data(PFM)
studentFit(~ cuprum.D + habitat.D + planvital.D + provida.D, data = PFM,
  family = Student(eta = 0.25), control = ctrl)



