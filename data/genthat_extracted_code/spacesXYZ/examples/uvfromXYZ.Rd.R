library(spacesXYZ)


### Name: uvfrom
### Title: Convert from XYZ or xy to Uniform Chromaticity Spaces
### Aliases: uvfromXYZ uvfromxy
### Keywords: XYZ

### ** Examples

# locate some standard illuminants on the 1976 UCS diagram
uvfromXYZ( standardXYZ( c('C','D50','D65','E')  ) )

##             u'        v'
##  C   0.2008921 0.4608838
##  D50 0.2091601 0.4880734
##  D65 0.1978398 0.4683363
##  E   0.2105263 0.4736842



