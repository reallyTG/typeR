library(wavethresh)


### Name: print.wpst
### Title: Prints out basic information about a wpst class object
### Aliases: print.wpst
### Keywords: print

### ** Examples

v <- rnorm(128)
vwpst <- wpst(v)
## Not run: print(vwpst)
#Class 'wpst' : Stationary Wavelet Packet Transform Object:
#	~~~  : List with 5 components with names
#		wpst nlevelsWT avixstart filter date
#
#$wpst is a coefficient vector
#
#Created on : Fri Mar  5 15:06:56 2010
#
#summary(.):
#----------
#Levels:  7
#Length of original:  128
#Filter was:  Daub cmpct on least asymm N=10
#Date:  Fri Mar  5 15:06:56 2010



