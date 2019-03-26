library(spacesXYZ)


### Name: standardXYZ
### Title: Query the Standardized XYZ and xy values of Standard Illuminants
###   and Whitepoints
### Aliases: standardXYZ standardxy

### ** Examples

standardXYZ( c('a','d50','D50.ICC','D65') ) 
#                 X Y         Z
# A       1.0985000 1 0.3558500
# D50     0.9642200 1 0.8252100
# D50.ICC 0.9642029 1 0.8249054
# D65     0.9504700 1 1.0888300

standardxy( c('a','D65','D60','D60.ACES','E','F2') )
#                x       y
# A        0.44758 0.40745
# D65      0.31270 0.32900
# D60      0.32163 0.33774
# D60.ACES 0.32168 0.33767
# E        0.33333 0.33333
# F2            NA      NA



