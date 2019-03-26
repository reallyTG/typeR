library(openxlsx)


### Name: createStyle
### Title: Create a cell style
### Aliases: createStyle

### ** Examples

## See package vignettes for further examples

## Modify default values of border colour and border line style
options("openxlsx.borderColour" = "#4F80BD")
options("openxlsx.borderStyle" = "thin")

## Size 18 Arial, Bold, left horz. aligned, fill colour #1A33CC, all borders,
style <- createStyle(fontSize = 18, fontName = "Arial",
  textDecoration = "bold", halign = "left", fgFill = "#1A33CC", border= "TopBottomLeftRight")

## Red, size 24, Bold, italic, underline, center aligned Font, bottom border
style <- createStyle(fontSize = 24, fontColour = rgb(1,0,0),
   textDecoration = c("bold", "italic", "underline"), 
   halign = "center", valign = "center", border = "Bottom")
 
# borderColour is recycled for each border or all colours can be supplied

# colour is recycled 3 times for "Top", "Bottom" & "Right" sides.
createStyle(border = "TopBottomRight", borderColour = "red") 

# supply all colours
createStyle(border = "TopBottomLeft", borderColour = c("red","yellow", "green"))



