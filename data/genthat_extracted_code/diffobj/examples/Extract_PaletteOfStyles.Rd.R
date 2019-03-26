library(diffobj)


### Name: [<-,PaletteOfStyles-method
### Title: Extract/Replace a Style Class or Object from PaletteOfStyles
### Aliases: [<-,PaletteOfStyles-method
###   [,PaletteOfStyles,ANY,ANY,ANY-method [[,PaletteOfStyles-method

### ** Examples

pal <- PaletteOfStyles()
pal[["ansi256", "light", "rgb"]]
pal["ansi256", "light", ]
pal["ansi256", "light", "rgb"] <- list(StyleAnsi8NeutralRgb())



