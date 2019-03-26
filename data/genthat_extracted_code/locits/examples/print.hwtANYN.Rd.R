library(locits)


### Name: print.hwtANYN
### Title: Print out a 'hwtANYN' class object, eg from the 'link{hwt}'
###   function.
### Aliases: print.hwtANYN
### Keywords: ts

### ** Examples

#
# Generate test vector of length 5
#
v2 <- rnorm(5)
#
# Compute Haar wavelet transform
#
v2.hwt <- hwt(v2)
#
# Print out the answer
#
print(v2.hwt)
#Class 'hwtANYN' : Haar Wavelet for Arbitrary Length Data object:
#       ~~~~~~~  : List with 5 components with names
#		   c d nlevels type reindex 
#
#
#summary(.):
#----------
#Levels:  2 
#Filter was: Haar
#Transform type:  wavelet 
#Object was reindex to match wd:  FALSE 



