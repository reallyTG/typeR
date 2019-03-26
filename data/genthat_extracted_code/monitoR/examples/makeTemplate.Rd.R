library(monitoR)


### Name: makeTemplate
### Title: Make an Acoustic Template
### Aliases: makeCorTemplate makeBinTemplate
### Keywords: manip hgraph

### ** Examples

# Load example Wave objects
data(btnw)
data(oven)

# Use a Wave object directly to make a template
## Not run: 
##D # Not run because it will create a file in user's working directory with write.wav = TRUE
##D wct1 <- makeCorTemplate(btnw, name = "w1", write.wav = TRUE)
##D wct1
## End(Not run)

# For traceability, better to use acoustic files
# Here, first write Wave objects to file (temporary directory used here)
btnw.fp <- file.path(tempdir(), "btnw.wav")
oven.fp <- file.path(tempdir(), "oven.wav")
writeWave(btnw, btnw.fp)
writeWave(oven, oven.fp)

# Use default arguments except for name
wct1 <- makeCorTemplate(btnw.fp, name = "w1")

# Specify time and frequency limits to focus on a smaller area
wct2 <- makeCorTemplate(btnw.fp, t.lim = c(1.5, 2.1), frq.lim = c(4.2, 5.6), name = "w2")

# For finer control, see options for select argument, e.g., 
## Not run: 
##D # Not run because requires user interaction
##D wct3 <- makeCorTemplate(btnw.fp, select = "cell", name = "w3")
##D wct4 <- makeCorTemplate(btnw.fp, select = "rectangle", name = "w4")
## End(Not run)

# Use a different recording--different species here
oct1 <- makeCorTemplate(oven.fp, name = "o1", t.lim = c(1, 4), frq.lim = c(1, 11))

# Reduce cell density
oct2 <- makeCorTemplate(oven.fp, name = "o2", t.lim = c(1, 4), frq.lim = c(1, 11), 
                        dens = 0.1)

# Binary templates are similar
# By default, amplitude cutoff is interactively set
## Not run: 
##D wbt1 <- makeBinTemplate(btnw.fp, name = "w1")
## End(Not run)

# Or specify cutoff directly
wbt1 <- makeBinTemplate(btnw.fp, amp.cutoff = -40, name = "w1")

# Specify time and frequency limits to focus on a smaller area in spectrogram, and add a 
# buffer
## Not run: 
##D wbt2 <- makeBinTemplate(btnw.fp, amp.cutoff = -30, t.lim = c(1.5, 2.1), 
##D                         frq.lim = c(4.2, 5.6), buffer = 2, name = "w2")
## End(Not run)

# For finer control, see options for select argument, e.g., 
## Not run: 
##D # Not run because it requires user input to select cells for the template
##D wbt3 <- makeBinTemplate(btnw.fp, amp.cutoff = -40, t.lim = c(0.5, 2.5), 
##D                         frq.lim = c(1, 11), select = "cell", name = "w3")
##D 
##D wbt4 <- makeBinTemplate(btnw.fp, amp.cutoff = -40, t.lim = c(0.5, 2.5), 
##D                         frq.lim = c(1, 11), select = "rectangle", buffer = 3, name = "w4")
## End(Not run)

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)

# TemplateList plotting help:
method?plot('TemplateList')



