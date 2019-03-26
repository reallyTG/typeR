library(munsellinterpol)


### Name: MunsellNameFromHVC
### Title: Convert Munsell Numeric to Munsell String Notation
### Aliases: MunsellNameFromHVC HueStringFromNumber
### Keywords: MunsellName

### ** Examples

MunsellNameFromHVC( c(39,5.1,7.3,  0,5.1234,0.003 )  )
##  [1] "9GY 5.1/7.3"    "10RP 5.1/0.003"

MunsellNameFromHVC( c(39,5.1,7.34,  0,5.1234,0.003 ), format='f' )
##  [1] "9.00GY 5.10/7.34" "N 5.10/"

HueStringFromNumber( seq( 2.5, 100, by=2.5 ) )   # make nice labels for a plot
##   [1] "2.5R"  "5R"    "7.5R"  "10R"   "2.5YR" "5YR"   "7.5YR" "10YR"  "2.5Y" 
##  [10] "5Y"    "7.5Y"  "10Y"   "2.5GY" "5GY"   "7.5GY" "10GY"  "2.5G"  "5G"   
##  [19] "7.5G"  "10G"   "2.5BG" "5BG"   "7.5BG" "10BG"  "2.5B"  "5B"    "7.5B" 
##  [28] "10B"   "2.5PB" "5PB"   "7.5PB" "10PB"  "2.5P"  "5P"    "7.5P"  "10P"  
##  [37] "2.5RP" "5RP"   "7.5RP" "10RP" 



