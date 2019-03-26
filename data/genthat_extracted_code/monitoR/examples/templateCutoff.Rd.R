library(monitoR)


### Name: templateCutoff
### Title: Query or Set Template Cutoffs
### Aliases: templateCutoff templateCutoff<-
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

# Check cutoffs
templateCutoff(ctemps)

# Change all like this 
templateCutoff(ctemps) <- c(0.35, 0.35, 0.35, 0.35)
# or this
templateCutoff(ctemps) <- c(default = 0.35)

# Change select ones like this
templateCutoff(ctemps) <- c(o1 = 0.45, o2 = 0.45)
# or this
templateCutoff(ctemps)[c(3, 4)] <- 0.45

# Could combine these two steps
templateCutoff(ctemps) <- c(default = 0.35, o1 = 0.45, o2 = 0.45)

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)



