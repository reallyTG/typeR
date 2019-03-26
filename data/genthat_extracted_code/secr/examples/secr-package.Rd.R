library(secr)


### Name: secr-package
### Title: Spatially Explicit Capture-Recapture Models
### Aliases: secr-package secr
### Keywords: package

### ** Examples

## Not run: 
##D 
##D ## generate some data & plot
##D detectors  <- make.grid (nx = 10, ny = 10, spacing = 20,
##D     detector = "multi")
##D plot(detectors, label = TRUE, border = 0, gridspace = 20)
##D detections <- sim.capthist (detectors, noccasions = 5,
##D     popn = list(D = 5, buffer = 100),
##D     detectpar = list(g0 = 0.2, sigma = 25))
##D session(detections) <- "Simulated data"
##D plot(detections, border = 20, tracks = TRUE, varycol = TRUE)
##D 
##D ## generate habitat mask
##D mask <- make.mask (detectors, buffer = 100, nx = 48)
##D 
##D ## fit model and display results
##D secr.model <- secr.fit (detections, model = g0~b, mask = mask)
##D secr.model
##D 
## End(Not run)



