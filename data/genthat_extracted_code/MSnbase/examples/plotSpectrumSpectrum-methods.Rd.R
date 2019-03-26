library(MSnbase)


### Name: plot.Spectrum.Spectrum-methods
### Title: Plotting a 'Spectrum' vs another 'Spectrum' object.
### Aliases: plot.Spectrum.Spectrum plot,Spectrum,Spectrum-method
### Keywords: methods

### ** Examples

## find path to a mzXML file
file <- dir(system.file(package = "MSnbase", dir = "extdata"),
            full.name = TRUE, pattern = "mzXML$")

## create basic MSnExp
msexp <- readMSData(file, centroided.=FALSE)

## centroid them
msexp <- pickPeaks(msexp)

## plot the first against the second spectrum
plot(msexp[[1]], msexp[[2]])

## add sequence information
plot(msexp[[1]], msexp[[2]], sequences=c("VESITARHGEVLQLRPK",
                                         "IDGQWVTHQWLKK"))


itraqdata2 <- pickPeaks(itraqdata)
(k <- which(fData(itraqdata2)[, "PeptideSequence"] == "TAGIQIVADDLTVTNPK"))
mzk <- precursorMz(itraqdata2)[k]
zk <- precursorCharge(itraqdata2)[k]
mzk * zk
plot(itraqdata2[[k[1]]], itraqdata2[[k[2]]])



