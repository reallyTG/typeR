library(colorSpec)


### Name: computeCCT
### Title: Compute Correlated Color Temperature (CCT) of Light Spectra
### Aliases: computeCCT computeCCT.colorSpec CCTfromXYZ CCTfromxy CCTfromuv
### Keywords: light

### ** Examples

computeCCT( D65.1nm )               # returns 6502.068
computeCCT( D65.1nm, meth='lm' )    # returns 6502.711
computeCCT( A.1nm )                 # returns 2855.656
computeCCT( A.1nm, meth='lm' )      # returns 2855.583
computeCCT( A.1nm, meth='mccamy' )  # returns 2857.188
CCTfromXYZ( c(1,1,1) )              # returns 5454.028

moon = readSpectra( system.file( "extdata/sources/moonlight.txt", package='colorSpec' ) )
computeCCT( moon )                  # returns 4482.371



