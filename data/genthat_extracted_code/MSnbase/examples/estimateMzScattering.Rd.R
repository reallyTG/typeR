library(MSnbase)


### Name: estimateMzScattering
### Title: Estimate m/z scattering in consecutive scans
### Aliases: estimateMzScattering

### ** Examples


library(MSnbase)
library(msdata)
## Load a profile-mode LC-MS data file
f <- dir(system.file("sciex", package = "msdata"), full.names = TRUE)[1]
im <- readMSData(f, mode = "inMem", msLevel = 1L)

res <- estimateMzScattering(im)

## Plot the distribution of estimated m/z scattering
plot(density(unlist(res)))

## Compare the m/z resolution and m/z scattering of the spectrum with the
## most peaks
idx <- which.max(unlist(spectrapply(im, peaksCount)))

res[[idx]]
abline(v = res[[idx]], lty = 2)
estimateMzResolution(im[[idx]])
## As expected, the m/z scattering is much lower than the m/z resolution.



