library(wavethresh)


### Name: print.wd
### Title: Print out information about an wd object in readable form.
### Aliases: print.wd
### Keywords: print

### ** Examples

#
# Generate an wd object.
#
tmp <- wd(rnorm(32))
#
# Now get R to use print.wd
#
tmp
# Class 'wd' : Discrete Wavelet Transform Object:
#        ~~  : List with 8 components with names
#               C D nlevelsWT fl.dbase filter type bc date 
#
# $ C and $ D are LONG coefficient vectors !
#
# Created on : Fri Oct 23 19:56:00 1998 
# Type of decomposition:  wavelet 
# 
# summary(.):
# ----------
# Levels:  5 
# Length of original:  32 
# Filter was:  Daub cmpct on least asymm N=10 
# Boundary handling:  periodic 
# Transform type:  wavelet 
# Date:  Fri Oct 23 19:56:00 1998 
#
#



