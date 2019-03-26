library(monitoR)


### Name: getDetections
### Title: Extract Detections or Peaks from a 'detectionList' Object
### Aliases: getDetections getPeaks
### Keywords: manip

### ** Examples

# Load data
data(btnw)
data(oven)
data(survey)

# Write Wave objects to file (temporary directory used here)
btnw.fp <- file.path(tempdir(), "btnw.wav")
oven.fp <- file.path(tempdir(), "oven.wav")
survey.fp <- file.path(tempdir(), "survey2010-12-31_120000_EST.wav")
writeWave(btnw, btnw.fp)
writeWave(oven, oven.fp)
writeWave(survey, survey.fp)

# Correlation example
# Create two correlation templates
wct <- makeCorTemplate(btnw.fp, t.lim = c(1.5, 2.1), frq.lim = c(4.2, 5.6), name = "w")
oct <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), dens = 0.1, name = "o")

# Combine both of them
ctemps <- combineCorTemplates(wct, oct)

# Calculate scores
cscores <- corMatch(survey.fp, ctemps)

# Find peaks
cdetects <- findPeaks(cscores)

# Finally, get detections
getDetections(cdetects)

# If list is preferred
getDetections(cdetects, output = "list")

# For select templates
getDetections(cdetects, which.one = 1)
getDetections(cdetects, which.one = "w")

# Or for all peaks
getPeaks(cdetects)
getPeaks(cdetects, output = "list")
getPeaks(cdetects, which.one = 1)

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)
file.remove(survey.fp)



