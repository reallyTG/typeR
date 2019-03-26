library(MSnbase)


### Name: calculateFragments-methods
### Title: Calculate ions produced by fragmentation.
### Aliases: calculateFragments calculateFragments,character,missing-method
###   defaultNeutralLoss
### Keywords: methods

### ** Examples

## find path to a mzXML file
file <- dir(system.file(package = "MSnbase", dir = "extdata"),
            full.name = TRUE, pattern = "mzXML$")

## create basic MSnExp
msexp <- readMSData(file, centroided = FALSE)

## centroid them
msexp <- pickPeaks(msexp)

## calculate fragments for ACE with default modification
calculateFragments("ACE", modifications=c(C=57.02146))

## calculate fragments for ACE with an addition N-terminal modification
calculateFragments("ACE", modifications=c(C=57.02146, Nterm=229.1629))

## calculate fragments for ACE without any modifications
calculateFragments("ACE", modifications=NULL)

calculateFragments("VESITARHGEVLQLRPK",
                   type=c("a", "b", "c", "x", "y", "z"),
                   z=1:2)

calculateFragments("VESITARHGEVLQLRPK", msexp[[1]])

## neutral loss
defaultNeutralLoss()

## disable water loss on the C terminal
defaultNeutralLoss(disableWaterLoss="Cterm")

## real example
calculateFragments("PQR")
calculateFragments("PQR",
                   neutralLoss=defaultNeutralLoss(disableWaterLoss="Cterm"))
calculateFragments("PQR",
                   neutralLoss=defaultNeutralLoss(disableAmmoniaLoss="Q"))

## disable neutral loss completely
calculateFragments("PQR", neutralLoss=NULL)



