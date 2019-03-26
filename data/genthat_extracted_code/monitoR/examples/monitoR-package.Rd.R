library(monitoR)


### Name: monitoR
### Title: Automated Acoustic Monitoring-overview and examples
### Aliases: monitoR-package monitoR
### Keywords: package iplot IO database

### ** Examples

# View spectrograms
data(survey)
viewSpec(survey)

# Annotate features
## Not run: 
##D # Not run because it is interactive and a file is written to user's working directory
##D viewSpec(survey, annotate = TRUE)
##D 
##D # View previous annotations
##D data(survey_anno)
##D 
##D write.csv(survey_anno, "survey_anno.csv", row.names = FALSE)
##D 
##D viewSpec(survey, annotate = TRUE, anno = "survey_anno.csv", start.time = 5)
## End(Not run)

# Load example Wave object
data(btnw)
data(oven)

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
## Not run: 
##D # Not run because it takes a second to draw the plot
##D # View results
##D plot(cdetects, hit.marker = "points")
##D 
##D # Interactively inspect individual detections
##D # Not run because it is interactive
##D cdetects <- showPeaks(cdetects, which.one = "w1", flim = c(2, 8), point = TRUE, 
##D                       scorelim = c(0, 1), verify = TRUE)
## End(Not run)



