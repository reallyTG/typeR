library(uGMAR)


### Name: diagnosticPlot
### Title: Quantile residual based diagnostic plots for GMAR, StMAR and
###   G-StMAR models
### Aliases: diagnosticPlot

### ** Examples

## No test: 
# GMAR model
params13 <- c(1.4, 0.88, 0.26, 2.46, 0.82, 0.74, 5.0, 0.68, 5.2, 0.72, 0.2)
gmar13 <- GSMAR(data=VIX, p=1, M=3, params=params13, model="GMAR")
diagnosticPlot(gmar13)

# Restricted GMAR model: plot also the individual statistics with
# their approximate critical bounds using the given data
params12r <- c(1.4, 1.8, 0.88, 0.29, 3.18, 0.84)
gmar12r <- GSMAR(data=VIX, p=1, M=2, params=params12r, model="GMAR",
 restricted=TRUE)
diagnosticPlot(gmar12r, nlags=10, nsimu=1, plot_indstats=TRUE)

# StMAR model
params12t <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 100, 3.6)
stmar12 <- GSMAR(data=VIX, p=1, M=2, params=params12t, model="StMAR")
diagnosticPlot(stmar12)

# G-StMAR model (similar to the StMAR model above)
params12gs <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 3.6)
gstmar12 <- GSMAR(data=VIX, p=1, M=c(1, 1), params=params12gs,
 model="G-StMAR")
diagnosticPlot(gstmar12)

# Restricted G-StMAR-model
params13gsr <- c(1.3, 1, 1.4, 0.8, 0.4, 2, 0.2, 0.25, 0.15, 20)
gstmar13r <- GSMAR(data=VIX, p=1, M=c(2, 1), params=params13gsr,
 model="G-StMAR", restricted=TRUE)
diagnosticPlot(gstmar13r)

# GMAR model as a mixture of AR(2) and AR(1) models
constraints <- list(diag(1, ncol=2, nrow=2), as.matrix(c(1, 0)))
params22c <- c(1.2, 0.85, 0.04, 0.3, 3.3, 0.77, 2.8, 0.77)
gmar22c <- GSMAR(data=VIX, p=2, M=2, params=params22c,
 model="GMAR", constraints=constraints)
diagnosticPlot(gmar22c)

# Such StMAR(3,2) that the AR coefficients are restricted to be
# the same for both regimes and that the second AR coefficients are
# constrained to zero.
params32trc <- c(2.2, 1.8, 0.88, -0.03, 2.4, 0.27, 0.40, 3.9, 1000)
stmar32rc <- GSMAR(data=VIX, p=3, M=2, params=params32trc, model="StMAR",
 restricted=TRUE, constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))
diagnosticPlot(stmar32rc)
## End(No test)



