library(wavethresh)


### Name: convert.wst
### Title: Convert a non-decimated wst object into a wd object.
### Aliases: convert.wst
### Keywords: manip

### ** Examples

#
# Generate a sequence of 32 random normals (say) and take their
# \code{packed-ordered non-decimated wavelet transform}
#
myrand <- wst(rnorm(32))
#
# Print out the result (to verify the class and type of the object)
#
#myrand
#Class 'wst' : Stationary Wavelet Transform Object:
#       ~~~  : List with 8 components with names
#              wp Carray nlevelsWT filter date 
#
#$WP and $Carray are the coefficient matrices

#
#Created on : Tue Sep 29 12:29:45 1998 
#
#summary(.):
#----------
#Levels:  5 
#Length of original:  32 
#Filter was:  Daub cmpct on least asymm N=10 
#Boundary handling:  periodic 

#Date:  Tue Sep 29 12:29:45 1998 
#
# Yep, the myrand object is of class: \code{wst.object}.
#
# Now let's convert it to class \code{wd}. The object
# gets returned and, as usual in S, is printed.
#
convert(myrand)
#Class 'wd' : Discrete Wavelet Transform Object:
#       ~~  : List with 8 components with names
#              C D nlevelsWT fl.dbase filter type bc date 
#
#$ C and $ D are LONG coefficient vectors !
#
#Created on : Tue Sep 29 12:29:45 1998 
#Type of decomposition:  station 
#
#summary(.):
#----------
#Levels:  5 
#Length of original:  32 
#Filter was:  Daub cmpct on least asymm N=10 
#Boundary handling:  periodic 
#Transform type:  station 
#Date:  Tue Sep 29 12:29:45 1998 
#
# The returned object is of class \code{wd} with a
# type of "station".
# I.e. it has been converted successfully.



