library(XMRF)


### Name: XMRF
### Title: Markov Random Fields for Exponential Family Distributions
### Aliases: XMRF

### ** Examples

# Example for LPGM
# Refer to the package's introduction for identical example
## Not run: n = 100
## Not run: p = 20
## Not run: sim <- XMRF.Sim(n=n, p=p, model="LPGM", graph.type="scale-free")
## Not run: simDat <- sim$X
## Not run: # Compute the optimal lambda
## Not run: lmax = lambdaMax(t(simDat))
## Not run: lambda = 0.01* sqrt(log(p)/n) * lmax
## Not run: # Run LPGM
## Not run: lpgm.fit <- XMRF(simDat, method="LPGM", N=10, lambda.path=lambda)
## Not run: ml = plotNet(sim$B, fn="simDat.netPlot.pdf")
## Not run: ml = plot(lpgm.fit, fn="lpgm.netPlot_1.pdf", i=1, mylayout=ml)
## Not run: plot(lpgm.fit, fn="lpgm.fit.net.pdf")




