library(leaflet)


### Name: awesomeIconList
### Title: Make awesome-icon set
### Aliases: awesomeIconList

### ** Examples


iconSet <- awesomeIconList(
  home = makeAwesomeIcon(icon = "Home", library = "fa"),
  flag = makeAwesomeIcon(icon = "Flag", library = "fa")
)

iconSet[c("home", "flag")]



