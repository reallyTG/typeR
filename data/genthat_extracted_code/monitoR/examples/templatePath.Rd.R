library(monitoR)


### Name: templatePath
### Title: Song clip path of Templates
### Aliases: templatePath templatePath<-
### Keywords: attribute

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

# To check paths
templatePath(ctemps)

# Change the first two
templatePath(ctemps)[1:2] <- c("~/templates/btnw.wav", "~/templates/btnw.wav")

# Clean up (only because these files were created in these examples)
file.remove(btnw.fp)
file.remove(oven.fp)



