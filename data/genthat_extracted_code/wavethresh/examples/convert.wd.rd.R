library(wavethresh)


### Name: convert.wd
### Title: Convert a non-decimated wd object into a wst object.
### Aliases: convert.wd
### Keywords: manip

### ** Examples

#
# Generate a sequence of 32 random normals (say) and take their
# \code{time-ordered non-decimated wavelet transform}
#
myrand <- wd(rnorm(32), type="station")
#
# Print out the result (to verify the class and type of the object)
#
#myrand
#Class 'wd' : Discrete Wavelet Transform Object:
#       ~~  : List with 8 components with names
#              C D nlevelsWT fl.dbase filter type bc date 
#
#$ C and $ D are LONG coefficient vectors !
#
#Created on : Tue Sep 29 12:17:53 1998 
#Type of decomposition:  station 
#
#summary(.):
#----------
#Levels:  5 
#Length of original:  32 
#Filter was:  Daub cmpct on least asymm N=10 
#Boundary handling:  periodic 
#Transform type:  station 
#Date:  Tue Sep 29 12:17:53 1998 
#
# Yep, the myrand object is of class: \code{wd.object}.
#
# Now let's convert it to class \code{wst}. The object
# gets returned and, as usual in S, is printed.
#
convert(myrand)
#Class 'wst' : Stationary Wavelet Transform Object:
#       ~~~  : List with 5 components with names
#              wp Carray nlevelsWT filter date 
#
#$wp and $Carray are the coefficient matrices
#
#Created on : Tue Sep 29 12:17:53 1998 
#
#summary(.):
#----------
#Levels:  5 
#Length of original:  32 
#Filter was:  Daub cmpct on least asymm N=10 
#Date:  Tue Sep 29 12:17:53 1998 
#
# Yes. The returned object is of class \code{wst.object}.
# I.e. it has been converted successfully.



