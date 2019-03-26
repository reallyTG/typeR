library(leaflet)


### Name: iconList
### Title: Make icon set
### Aliases: iconList

### ** Examples


iconSet <- iconList(
  red = makeIcon("leaf-red.png", iconWidth = 32, iconHeight = 32),
  green = makeIcon("leaf-green.png", iconWidth = 32, iconHeight = 32)
)

iconSet[c("red", "green", "red")]



