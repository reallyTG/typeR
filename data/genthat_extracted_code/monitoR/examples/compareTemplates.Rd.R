library(monitoR)


### Name: compareTemplates
### Title: Compare Performance of Templates
### Aliases: compareTemplates
### Keywords: manip

### ** Examples

# Load data
data(btnw)

# Write Wave objects to file (temporary directory used here)
btnw.fp <- file.path(tempdir(), "btnw.wav")

writeWave(btnw, btnw.fp)

# Make three templates to compare
btnw.1 <- makeBinTemplate(clip = btnw.fp, frq.lim = c(2.75, 7), t.lim = c(.5, 2.5), 
                          amp.cutoff = -20, name = -20)

btnw.2 <- makeBinTemplate(clip = btnw.fp, frq.lim = c(2.75, 7), t.lim = c(.5, 2.5), 
                          amp.cutoff = -27, name = -27)

btnw.3 <- makeBinTemplate(clip = btnw.fp, frq.lim = c(2.75, 7), t.lim = c(.5, 2.5), 
                          amp.cutoff = -34, name = -34)

# Combine templates
templates <- combineBinTemplates(btnw.1, btnw.2, btnw.3)

survey <- bind(btnw, btnw, btnw)

survey.fp <- file.path(tempdir(), "survey.wav")

writeWave(survey, survey.fp)

scores <- binMatch(survey = survey.fp, templates = templates, time.source = "fileinfo")

pks <- findPeaks(scores)

compareTemplates(detection.obj = pks, cutoff.return = 12, cutoff.ignore = 6, tol = 1, 
                 n.drop = 0) 

# Clean up
file.remove(btnw.fp)
file.remove(survey.fp)



