library(shotGroups)


### Name: fromMOA
### Title: Conversion from angular diameter to absolute size
### Aliases: fromMOA

### ** Examples

size <- seq(1, 20, by=5)   # inch
dst  <- 100                # yard
fromMOA(size, dst=dst, conversion='yd2in', type='MOA')

# this should return objSize
MOA <- getMOA(size, dst=dst, conversion='yd2in', type='MOA')
fromMOA(MOA, dst=dst, conversion='yd2in', type='MOA')
        
# SMOA
fromMOA(c(1, 2, 5), dst=100, conversion='yd2in', type='SMOA')

# milliradian
fromMOA(c(1, 2, 5), dst=100, conversion='m2mm', type='mrad')



