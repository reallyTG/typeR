library(huxtable)


### Name: rowspecs
### Title: Different ways to select rows and columns
### Aliases: rowspecs

### ** Examples

set_bold(jams, 2:4, 1:2, TRUE)
set_background_color(jams, evens, everywhere,
      "grey95")
set_bold(jams, everywhere,
      tidyselect::matches("yp"), TRUE)

set_text_color(jams, 2:4, 1:2,
      c("red", "violetred", "purple"))



