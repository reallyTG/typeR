library(uGMAR)


### Name: quantileResiduals
### Title: Compute quantile residuals of GMAR, StMAR or G-StMAR model
### Aliases: quantileResiduals

### ** Examples

# GMAR model
params12 <- c(1.12, 0.9, 0.29, 4.53, 0.7, 3.22, 0.84)
qr12 <- quantileResiduals(VIX, 1, 2, params12)

# Restricted GMAR model
params12r <- c(1.4, 1.8, 0.88, 0.29, 3.18, 0.84)
qr12r <- quantileResiduals(VIX, 1, 2, params12r, restricted=TRUE)

# StMAR model
params12t <- c(1.1, 0.9, 0.3, 4.5, 0.7, 3.2, 0.8, 5, 8)
qr12t <- quantileResiduals(VIX, 1, 2, params12t, model="StMAR")

# Non-mixture version of StMAR model
params11t <- c(0.76, 0.93, 1.35, 2.4)
qr11t <- quantileResiduals(VIX, 1, 1, params11t, model="StMAR")

# G-StMAR model
params12gs <- c(1.5, 0.8, 1.5, 2.9, 0.8, 1.1, 0.6, 3)
qr12gs <- quantileResiduals(VIX, 1, c(1, 1), params12gs, model="G-StMAR")

# Restricted G-StMAR model
params13gsr <- c(1.3, 1, 1.4, 0.8, 0.4, 2, 0.2, 0.25, 0.15, 20)
qr12gsr <- quantileResiduals(VIX, 1, c(2, 1), params13gsr, model="G-StMAR", restricted=TRUE)

# GMAR model as a mixture of AR(2) and AR(1) models
constraints <- list(diag(1, ncol=2, nrow=2), as.matrix(c(1, 0)))
params22c <- c(1.2, 0.85, 0.04, 0.3, 3.3, 0.77, 2.8, 0.77)
qr22c <- quantileResiduals(VIX, 2, 2, params22c, constraints=constraints)

# Such StMAR(3,2) that the AR coefficients are restricted to be
# the same for both regimes and that the second AR coefficients are
# constrained to zero.
params32trc <- c(2.2, 1.8, 0.88, -0.03, 2.4, 0.27, 0.40, 3.9, 1000)
qr32trc <- quantileResiduals(VIX, 3, 2, params32trc, model="StMAR",
 restricted=TRUE, constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))



