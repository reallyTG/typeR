library(monitoR)


### Name: findPeaks
### Title: Find Score Peaks and Detections in a 'templateScores' Object
### Aliases: findPeaks
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

# Combine them
ctemps <- combineCorTemplates(wct, oct)

# Calculate scores
cscores <- corMatch(survey.fp, ctemps)

# Finally, find peaks and detections
cdetects <- findPeaks(cscores)

cdetects

plot(cdetects)

# plotting help:
method?plot('detectionList')

# Binary example
## Not run: 
##D # Not run because of the time required (maybe 2-5 seconds) Create two templates
##D wbt <- makeBinTemplate(btnw.fp, amp.cutoff = -30, t.lim = c(1.5, 2.1), frq.lim = c(4.2, 5.6),
##D                        buffer = 2, name = "w")
##D 
##D obt <- makeBinTemplate(oven.fp, amp.cutoff = -20, t.lim = c(1, 4), frq.lim = c(1, 11), 
##D                        name = "o")
##D 
##D # Combine them
##D btemps <- combineBinTemplates(wbt, obt)
##D 
##D # Calculate scores
##D bscores <- binMatch(survey.fp, btemps)
##D 
##D # Finally, find peaks and detections
##D bdetects <- findPeaks(bscores)
##D 
##D bdetects
##D 
##D plot(bdetects)
## End(Not run)

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)
file.remove(survey.fp)



