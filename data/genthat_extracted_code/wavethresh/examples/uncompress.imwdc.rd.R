library(wavethresh)


### Name: uncompress.imwdc
### Title: Uncompress an imwdc class object
### Aliases: uncompress.imwdc
### Keywords: manip

### ** Examples

data(lennon)
#
# Do 2D wavelet transform on lennon image
#
lwd <- imwd(lennon)
#
# Do threshold the wavelet coefficients, a lot of zeroes are present
#
lmdT <- threshold(lwd)
#
# What is the class of the thresholded object?
#
class(lmdT)
#[1] "imwdc"
#
# note that the coefficients are stored efficiently in the imwdc class object
#
uncompress(lmdT)
#Class 'imwd' : Discrete Image Wavelet Transform Object:
#~~~~  : List with 30 components with names
#nlevelsWT fl.dbase filter w0Lconstant bc type w0L1 w0L2 w0L3 w1L1 w1L2
#w1L3 w2L1 w2L2 w2L3 w3L1 w3L2 w3L3 w4L1 w4L2 w4L3 w5L1 w5L2 w5L3 w6L1
#w6L2 w6L3 w7L1 w7L2 w7L3
#
#$ wNLx are LONG coefficient vectors !
#
#summary(.):
#----------
#UNcompressed image wavelet decomposition structure
#Levels:  8
#Original image was 256 x 256  pixels.
#Filter was:  Daub cmpct on least asymm N=10
#Boundary handling:  periodic



