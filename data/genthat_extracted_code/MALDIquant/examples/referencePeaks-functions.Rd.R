library(MALDIquant)


### Name: referencePeaks
### Title: Creates a reference 'MassPeaks' object.
### Aliases: referencePeaks
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create four MassPeaks objects and add them to the list
p<- list(createMassPeaks(mass=1:2, intensity=1:2),
         createMassPeaks(mass=1:3, intensity=1:3),
         createMassPeaks(mass=1:4, intensity=1:4),
         createMassPeaks(mass=1:5, intensity=1:5))

## only use peaks which occur in all MassPeaks objects as reference peaks
refPeaks <- referencePeaks(p, minFrequency=1)

mass(refPeaks)      # 1:2
intensity(refPeaks) # c(1, 1)



