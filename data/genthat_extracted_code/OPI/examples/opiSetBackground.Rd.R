library(OPI)


### Name: opiSetBackground
### Title: Set background using OPI.
### Aliases: opiSetBackground
### Keywords: misc

### ** Examples

chooseOpi("SimGaussian")
if (!is.null(opiInitialize(sd=2, display=c(-30,30,-30,30))))
    stop("opiInitialize failed")
if (!is.null(opiSetBackground(col="white",gridCol="grey")))
    stop("opiSetBackground failed, which is very surprising!")

## Not run: 
##D chooseOpi("Octopus900")
##D oi <- opiInitialize(eyeSuiteJarLocation="c:/EyeSuite/",
##D         eyeSuiteSettingsLocation="c:/Documents and Settings/All Users/Haag-Streit/",
##D         eye="left")
##D if (!is.null(oi))
##D     stop("opiInitialize failed")
##D if (!is.null(opiSetBackground(fixation=.Octopus900Env$FIX_CENTRE)))
##D     stop("opiSetBackground failed")
##D if (!is.null(opiSetBackground(fixation=.Octopus900Env$FIX_RING, fixIntensity=0)))
##D     stop("opiSetBackground failed")
##D if (!is.null(opiSetBackground(color=.Octopus900Env$MET_COL_BY)))
##D     stop("opiSetBackground failed")
##D if (!is.null(opiSetBackground(lum=.Octopus900Env$BG_100, color=.Octopus900Env$MET_COL_RW)))
##D     stop("opiSetBackground failed")
##D opiClose()
## End(Not run)



