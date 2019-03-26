library(MVT)


### Name: envelope
### Title: QQ-plot with simulated envelopes
### Aliases: envelope
### Keywords: dplot

### ** Examples

data(PFM)
fit <- studentFit(~ cuprum.D + habitat.D + planvital.D + provida.D, data = PFM,
  family = Student(eta = 0.25))
envelope(fit, reps = 500, conf = 0.95)



