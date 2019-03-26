library(basictabler)


### Name: getSimpleColoredTblTheme
### Title: Get a simple coloured theme.
### Aliases: getSimpleColoredTblTheme

### ** Examples

orangeColors <- list(
  headerBackgroundColor = "rgb(237, 125, 49)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor = "rgb(255, 255, 255)",
  cellColor = "rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(248, 198, 165)",
  totalColor = "rgb(0, 0, 0)",
  borderColor = "rgb(198, 89, 17)"
)
library(basictabler)
tbl <- qtbl(data.frame(a=1:2, b=3:4))
tbl$theme <- getSimpleColoredTblTheme(parentTable=tbl,
    colors=orangeColors, fontName="Garamond, arial")
tbl$renderTable()



