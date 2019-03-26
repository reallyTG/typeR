library(secr)


### Name: secr.fit
### Title: Spatially Explicit Capture-Recapture
### Aliases: secr.fit binomN
### Keywords: models

### ** Examples


## Not run: 
##D 
##D ## construct test data (array of 48 `multi-catch' traps)
##D 
##D detectors <- make.grid (nx = 6, ny = 8, detector = "multi")
##D detections <- sim.capthist (detectors, popn = list(D = 10,
##D     buffer = 100), detectpar = list(g0 = 0.2, sigma = 25))
##D 
##D ## fit & print null (constant parameter) model
##D secr0 <- secr.fit (detections)
##D secr0   ## uses print method for secr
##D 
##D ## compare fit of null model with learned-response model for g0
##D 
##D secrb <- secr.fit (detections, model = g0~b)
##D AIC (secr0, secrb)
##D 
##D ## typical result
##D 
##D ##                  model   detectfn npar    logLik     AIC    AICc dAICc  AICwt
##D ## secr0 D~1 g0~1 sigma~1 halfnormal    3 -347.1210 700.242 700.928 0.000 0.7733
##D ## secrb D~1 g0~b sigma~1 halfnormal    4 -347.1026 702.205 703.382 2.454 0.2267
## End(Not run)



