library(stabs)


### Name: quic.graphical_model
### Title: Stability selection fit function for sparse inverse covariance
###   using QUIC
### Aliases: quic.graphical_model getLamPath
### Keywords: models nonlinear nonparametric

### ** Examples

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
if (require("huge") && require("QUIC")) {
  set.seed(10010)
  dat.hubs <- huge.generator(n = 1000, d = 40, graph = "hub")
  s.hubs <- stabsel(x = dat.hubs$data, fitfun = quic.graphical_model, 
                    cutoff = 0.75, PFER = 10)
}
## End(No test)



