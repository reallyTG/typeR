library(monitoR)


### Name: readTemplates
### Title: Read Acoustic Templates from a Local Disk
### Aliases: readBinTemplates readCorTemplates
### Keywords: IO file

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
# Create one correlation templates
wct1 <- makeCorTemplate(btnw.fp, name = "w1")
wct2 <- makeCorTemplate(btnw.fp, t.lim = c(1.5, 2.1), frq.lim = c(4.2, 5.6), name = "w2")
oct1 <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), name = "o1")
oct2 <- makeCorTemplate(oven.fp, t.lim = c(1, 4), frq.lim = c(1, 11), dens = 0.1, name = "o2")

# Combine all of them
ctemps <- combineCorTemplates(wct1, wct2, oct1, oct2)

## Not run: 
##D # Write ctemps to a directory "templates"
##D writeCorTemplates(ctemps, dir = "templates")
##D 
##D # Read in all correlation templates in a directory "templates"
##D ctemps <- readCorTemplates(dir = "templates")
##D 
##D # Read in two specific files
##D ctemps <- readCorTemplates(files = c("o1.ct", "o2.ct"), dir = "templates")
##D 
##D # Read in two specific files, and give them names
##D ctemps <- readCorTemplates(files = c(oven1 = "o1.ct", oven2 = "o2.ct"), dir = "templates")
## End(Not run)

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)



