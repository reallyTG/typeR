library(rld)


### Name: rld.design
### Title: Power analysis for the Repeated-Low Dose Experiments
### Aliases: rld.design print.rld.design
### Keywords: design

### ** Examples

designout <- rld.design(nsim = 50, nv = 25, np = 25, ndlevel = 3, nexposure = c(10, 10, 2),
           rho = 0.2, p0 = c(0.16, 0.22, 0.27), RR = c(0.3, 0.45, 0.55),
           method = "log-rank", Siglevel = 0.05)



