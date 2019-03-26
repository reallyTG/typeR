library(shotGroups)


### Name: getMOA
### Title: Conversion of absolute size to angular diameter
### Aliases: getMOA

### ** Examples

size <- seq(1, 20, by=5)   # inch
dst  <- 100                # yard
getMOA(size, dst=dst, conversion='yd2in', type='MOA')

# this should return objSize
MOA <- getMOA(size, dst=dst, conversion='yd2in', type='MOA')
fromMOA(MOA, dst=dst, conversion='yd2in', type='MOA')

# SMOA
getMOA(c(1, 2, 5), dst=100, conversion='yd2in', type='SMOA')

# milliradian
getMOA(c(10, 20, 50), dst=100, conversion='m2mm', type='mrad')



