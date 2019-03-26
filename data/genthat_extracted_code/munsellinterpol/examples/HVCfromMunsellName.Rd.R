library(munsellinterpol)


### Name: HVCfromMunsellName
### Title: Convert Munsell Notation to numerical HVC
### Aliases: HVCfromMunsellName MunsellHVC HueNumberFromString
### Keywords: MunsellName

### ** Examples

HVCfromMunsellName( c( "4.2P 2.9/3.8", "N 2.3/", "N 8.9/0" ) )
##                  H   V   C
##  4.2P 2.9/3.8 84.2 2.9 3.8
##  N 2.3/        0.0 2.3 0.0
##  N 8.9/0       0.0 8.9 0.0

HueNumberFromString( c('4B','4.6GY','10RP','N') )
##  [1]  64.0  34.6 100.0    NA



