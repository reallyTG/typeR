library(BoutrosLab.plotting.general)


### Name: default.colours
### Title: Provides default colour schemes.
### Aliases: default.colours default.colors
### Keywords: colour scheme

### ** Examples


default.colours(number.of.colours = 6, is.greyscale = FALSE, palette.type = 'div')
# Returns:
# [1] "#B32B2B" "#DD4E4E" "#EB7C7C" "#F7BEBE" "#BEF4F7" "#80CDD1"

default.colours(number.of.colours = 3, palette.type = NULL, is.venn = TRUE)
# Returns:
# [1] "red"        "dodgerblue" "yellow"    
# [1] "darkred"    "darkblue"   "darkorange"
# The second line of colours is the corresponding text colour

default.colours(number.of.colours = c('2','5','3'), c('binary','seq','seq'))
# Returns:
# [[1]]
# [1] "white"       "chartreuse3"

# [[2]]
# [1] "lavenderblush"  "pink"           "palevioletred1" "violetred1"    
# [5] "maroon"        

# [[3]]
# [1] "aliceblue"    "lightblue1"   "lightskyblue"

default.colours(5, 'spiral.sunrise');
# Returns: 
# [1] "#336A90" "#65B4A2" "#B1D39A" "#F4E0A6" "#FFE1EE"




