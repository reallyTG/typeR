library(sorvi)


### Name: municipality_to_province
### Title: List province for each municipality in Finland.
### Aliases: municipality2province municipality_to_province
### Keywords: utilities

### ** Examples

# Info table for municipalities:
# municipality.info <- get_municipality_info_mml()
# List all municipalities:
# all.municipalities <- as.character(municipality.info$Kunta)
# Pick province for given municipalities:
# mapping between municipalities (kunta) and provinces (maakunta)
# m2p <- municipality_to_province(c("Helsinki", "Tampere", "Turku"))
# Speed up by providing predefined table of municipality info:
# m2p <- municipality_to_province(c("Helsinki", "Tampere", "Turku"), municipality.info)



