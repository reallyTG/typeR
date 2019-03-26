library(OPI)


### Name: opiInitialize
### Title: Initialize OPI.
### Aliases: opiInitialize opiInitialise
### Keywords: misc

### ** Examples

    # Set up a simple simulation for white-on-white perimetry
chooseOpi("SimHenson")
if (!is.null(opiInitialize(type="C", cap=6)))
    stop("opiInitialize failed")

    # Set up a simple simulation for white-on-white perimetry
    # and display the stimuli in a plot region
chooseOpi("SimHenson")
if (!is.null(opiInitialize(type="C", cap=6, display=c(-30,30,-30,30))))
    stop("opiInitialize failed")

    # Set up a simple simulation for white-on-white perimetry
    # and display the stimuli in a plot region and simulate response times
chooseOpi("SimHensonRT")
data(RtSigmaUnits)
oi <- opiInitialize(type="C", cap=6, 
        display=c(-30,30,-30,30), rtData=RtSigmaUnits, rtFP=1:100)
if (!is.null(oi))
    stop("opiInitialize failed")

    # Set up a simulation using a psychometric function that is
    # a cumulative gaussian of standard deviation 2
chooseOpi("SimGaussian")
if (!is.null(opiInitialize(sd=2)))
    stop("opiInitialize failed")

## Not run: 
##D     # Set up the Octopus 900
##D chooseOpi("Octopus900")
##D if (!is.null(opiInitialize(
##D         eyeSuiteJarLocation="C:/Program Files (x86)/Haag-Streit/EyeSuite/", 
##D         eyeSuiteSettingsLocation="C:/ProgramData/Haag-Streit/EyeSuite/",
##D         eye="left")))
##D     stop("opiInitialize failed")
## End(Not run)

## Not run: 
##D     # Set up the Kowa AP-7000
##D chooseOpi("KowaAP7000")
##D opiInitialize(ip="192.168.1.7", port=44965)
## End(Not run)

## Not run: 
##D     # Set up the imo
##D chooseOpi("imo")
##D opiInitialize(ip="192.168.1.7", port=44965)
## End(Not run)

## Not run: 
##D     # Set up the imo
##D chooseOpi("Compass")
##D result <- opiInitialize(ip="192.168.1.7", port=44965)
##D if (is.null(result$err)) {
##D     print(result$prl)
##D }
## End(Not run)



