library(secrdesign)


### Name: saturation
### Title: Detector saturation
### Aliases: saturation
### Keywords: manip

### ** Examples


tr <- traps(captdata)
detector(tr) <- 'multi'
mask <- make.mask(tr, buffer = 100)
saturation(tr, mask, detectpar = list(lambda0 = 0.27, sigma = 29), 
    detectfn = 'HHN', D = 5.5, plt = TRUE)
plotMaskEdge(as.mask(tr), add = TRUE)  ## boundary line

# empirical - useful for extractfn argument of secrdesign::run.scenarios
satfn <- function(CH) { 
    sumCH <- summary(CH)$counts
    sumCH['detectors visited', 'Total'] /  sumCH['detectors used', 'Total']
}
satfn(captdata)




