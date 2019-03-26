library(uGMAR)


### Name: plot.qrtest
### Title: Quantile residual tests for GMAR, StMAR or G-StMAR model
### Aliases: plot.qrtest print.qrtest quantileResidualTests

### ** Examples

## No test: 
# GMAR model
params12 <- c(1.12, 0.91, 0.29, 4.53, 0.70, 3.21, 0.84)
gmar12 <- GSMAR(VIX, 1, 2, params12)
qrtest12 <- quantileResidualTests(gmar12)
plot(qrtest12)

# Restricted GMAR model
params12r <- c(1.4, 1.8, 0.88, 0.29, 3.18, 0.84)
gmar12r <- GSMAR(data=VIX, p=1, M=2, params=params12r, model="GMAR",
 restricted=TRUE)
qrtest12r <- quantileResidualTests(gmar12r, lagsAC=1:10, nsimu=1)
plot(qrtest12r)

# StMAR model
params12t <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 100, 3.6)
stmar12 <- GSMAR(data=VIX, p=1, M=2, params=params12t, model="StMAR")
quantileResidualTests(stmar12, lagsAC=c(1, 2, 5), nsimu=1)

# G-StMAR model
params12gs <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 3.6)
gstmar12 <- GSMAR(data=VIX, p=1, M=c(1, 1), params=params12gs,
 model="G-StMAR")
quantileResidualTests(gstmar12, lagsAC=c(1, 3), lagsCH=1:2, nsimu=1)

# Such StMAR(3,2) that the AR coefficients are restricted to be
# the same for both regimes and that the second AR coefficients are
# constrained to zero.
params32trc <- c(2.2, 1.8, 0.88, -0.03, 2.4, 0.27, 0.40, 3.9, 1000)
stmar32rc <- GSMAR(data=VIX, p=3, M=2, params=params32trc, model="StMAR",
 restricted=TRUE, constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))
quantileResidualTests(stmar32rc, lagsAC=c(1, 3), nsimu=1)
## End(No test)



