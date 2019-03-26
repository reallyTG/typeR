library(monitoR)


### Name: showPeaks
### Title: View or Verify Detections or Peaks
### Aliases: showPeaks
### Keywords: dynamic iplot

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

# Combine them
ctemps <- combineCorTemplates(wct, oct)

# Calculate scores
cscores <- corMatch(survey.fp, ctemps)

# Find peaks and detections
cdetects <- findPeaks(cscores)
cdetects

# Interactively inspect individual detections, no return value
## Not run: 
##D # Not run because user input is required
##D showPeaks(detection.obj = cdetects, which.one = "w", flim = c(2, 8), point = TRUE, 
##D           scorelim = c(0, 1))
##D 
##D # Interactively verify individual detections, return adds verification field
##D cdetects <- showPeaks(detection.obj = cdetects, which.one = "w", flim = c(0, 20), 
##D                       point = TRUE, scorelim = c(0, 1), verify = TRUE)
## End(Not run)




