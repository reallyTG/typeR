library(monitoR)


### Name: templateComment
### Title: Query or Set Template Cutoffs
### Aliases: templateComment templateComment<-
### Keywords: manip attribute

### ** Examples

# Load data
data(btnw)
data(oven)

# Write Wave objects to file (temporary directory used here)
btnw.fp <- file.path(tempdir(), "btnw.wav")
oven.fp <- file.path(tempdir(), "oven.wav")
writeWave(btnw, btnw.fp)
writeWave(oven, oven.fp)

# Create four correlation templates
wct1 <- makeCorTemplate(btnw.fp, name = "w1")
wct2 <- makeCorTemplate(btnw.fp, t.lim = c(1.5, 2.1), frq.lim = c(4.2, 5.6), name = "w2")
oct1 <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), name = "o1")
oct2 <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), dens = 0.1, name = "o2")

# Combine all of them
ctemps <- combineCorTemplates(wct1, wct2, oct1, oct2)
ctemps

# Add a comment for two templates
templateComment(ctemps) <- c(w1 = "This is the best template so far.", 
                           o1 = "Should we drop the lowest syllable?")

# Add a default comment also
templateComment(ctemps) <- c(w1 = "This is the best template so far.", 
                           o1 = "Should we drop the lowest syllable?", 
                           default = "These templates have not been tested.")
# View comments
templateComment(ctemps)

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)



