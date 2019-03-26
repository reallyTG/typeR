library(wavethresh)


### Name: print.imwd
### Title: Print out information about an imwd object in readable form.
### Aliases: print.imwd
### Keywords: utilities

### ** Examples

#
# Generate an imwd object.
#
tmp <- imwd(matrix(0, nrow=32, ncol=32))
#
# Now get R to use print.imwd
#
tmp
# Class 'imwd' : Discrete Image Wavelet Transform Object:
#        ~~~~  : List with 27 components with names
#              nlevelsWT fl.dbase filter type bc date w4L4 w4L1 w4L2 w4L3
# w3L4 w3L1 w3L2 w3L3 w2L4 w2L1 w2L2 w2L3 w1L4 w1L1 w1L2 w1L3 w0L4 w0L1
# w0L2 w0L3 w0Lconstant 
#
# $ wNLx are LONG coefficient vectors !
#
# summary(.):
# ----------
# UNcompressed image wavelet decomposition structure
# Levels:  5 
# Original image was 32 x 32  pixels.
# Filter was:  Daub cmpct on least asymm N=10 
# Boundary handling:  periodic 




