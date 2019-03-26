library(wavethresh)


### Name: print.wd3D
### Title: Print out information about an wd3D object in a readable form.
### Aliases: print.wd3D
### Keywords: manip

### ** Examples

#
# Generate an wd3D object.
#
tmp <- wd3D(array(rnorm(512), dim=c(8,8,8)))
#
# Now get R to use print.wd
#
tmp
#Class 'wd3d' : 3D DWT Object:
#       ~~~~  : List with 5 components with names
#              a filter.number family date nlevelsWT 
#
#$ a is the wavelet coefficient array
#Dimension of a is [1] 8 8 8
#
#Created on : Wed Oct 20 17:24:15 BST 1999 
#
#summary(.):
#----------
#Levels:  3 
#Filter number was:  10 
#Filter family was:  DaubLeAsymm 
#Date:  Wed Oct 20 17:24:15 BST 1999 



