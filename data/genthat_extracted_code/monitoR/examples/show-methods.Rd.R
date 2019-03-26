library(monitoR)


### Name: show-methods
### Title: Methods for the 'show' and 'summary' Functions
### Aliases: show-methods show,binTemplateList-method
###   show,corTemplateList-method show,detectionList-method
###   show,templateScores-method summary-methods
###   summary,binTemplateList-method summary,corTemplateList-method
###   summary,TemplateList-method summary,detectionList-method
###   summary,templateScores-method
### Keywords: methods print

### ** Examples

# Load data
data(btnw)
data(oven)

# Write Wave objects to file (temporary directory used here)
btnw.fp <- file.path(tempdir(), "btnw.wav")
oven.fp <- file.path(tempdir(), "oven.wav")
writeWave(btnw, btnw.fp)
writeWave(oven, oven.fp)

# Correlation example
# Create two correlation templates
wct <- makeCorTemplate(btnw.fp, t.lim = c(1.5, 2.1), frq.lim = c(4.2, 5.6), name = "w")
oct <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), dens = 0.1, name = "o")

# Combine them
ctemps <- combineCorTemplates(wct, oct)

# Then for a quick summary:
ctemps

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)



