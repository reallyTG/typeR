library(wavethresh)


### Name: print.wst
### Title: Print out information about an wst object in readable form.
### Aliases: print.wst
### Keywords: print

### ** Examples

#
# Generate an wst object (a "nonsense" one for
# the example).
#
vwst <- wst(DJ.EX()$heavi)
#
# Now get Splus/R to use print.wst
#
vwst
#Class 'wst' : Stationary Wavelet Transform Object:
#       ~~~  : List with 5 components with names
#              wp Carray nlevelsWT filter date 
#
#$wp and $Carray are the coefficient matrices
#
#Created on : Wed Sep 08 09:24:03 2004 
#
#summary(.):
#----------
#Levels:  10 
#Length of original:  1024 
#Filter was:  Daub cmpct on least asymm N=10 
#Date:  Wed Sep 08 09:24:03 2004 



