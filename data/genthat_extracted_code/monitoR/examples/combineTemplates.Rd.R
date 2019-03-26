library(monitoR)


### Name: combineTemplates
### Title: Combine Acoustic Template Lists
### Aliases: combineCorTemplates combineBinTemplates
### Keywords: manip utilities

### ** Examples

# First need to make some template lists to combine
# Load data
data(btnw)
data(oven)
data(survey)

# Write Wave objects to file (temporary directory used here)
btnw.fp <- file.path(tempdir(), "btnw.wav")

oven.fp <- file.path(tempdir(), "oven.wav")

writeWave(btnw, btnw.fp)

writeWave(oven, oven.fp)

# Create four correlation templates
wct1 <- makeCorTemplate(btnw.fp, name = "w1")

wct2 <- makeCorTemplate(btnw.fp, t.lim = c(1.5, 2.1), frq.lim = c(4.2, 5.6), 
                        name = "w2")

oct1 <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), name = "o1")

oct2 <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), dens = 0.1, 
                        name = "o2")

# Combine all of them
ctemps <- combineCorTemplates(wct1, wct2, oct1, oct2)
ctemps

# Binary templates are similar
# Create four templates
wbt1 <- makeBinTemplate(btnw.fp, amp.cutoff = -40, name = "w1")

wbt2 <- makeBinTemplate(btnw.fp, amp.cutoff = -30, t.lim = c(1.5, 2.1), 
                        frq.lim = c(4.2, 5.6), buffer = 2, name = "w2")

obt1 <- makeBinTemplate(oven.fp, amp.cutoff = -20, t.lim = c(1, 4), 
                        frq.lim = c(1, 11), name = "o1")

obt2 <- makeBinTemplate(oven.fp, amp.cutoff = -17, t.lim = c(1, 4), 
                        frq.lim = c(1, 11), buffer = 2, name = "o2")

# Combine all of them
btemps <- combineBinTemplates(wbt1, wbt2, obt1, obt2)
btemps

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)

file.remove(oven.fp)



