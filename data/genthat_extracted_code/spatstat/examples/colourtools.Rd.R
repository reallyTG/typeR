library(spatstat)


### Name: colourtools
### Title: Convert and Compare Colours in Different Formats
### Aliases: colourtools paletteindex rgb2hex rgb2hsva col2hex paletteindex
###   samecolour complementarycolour interp.colours is.colour is.grey
###   to.grey to.opaque to.transparent to.saturated
### Keywords: color

### ** Examples

  samecolour("grey", "gray")
  paletteindex("grey")
  col2hex("orange")
  to.grey("orange")
  to.saturated("orange")
  complementarycolour("orange")
  is.grey("lightgrey")
  is.grey(8)
  to.transparent("orange", 0.5)
  to.opaque("red")
  interp.colours(c("orange", "red", "violet"), 5)



