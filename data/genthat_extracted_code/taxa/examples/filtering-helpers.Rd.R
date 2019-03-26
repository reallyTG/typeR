library(taxa)


### Name: filtering-helpers
### Title: Taxonomic filtering helpers
### Aliases: filtering-helpers ranks nms ids

### ** Examples

ranks("genus")
ranks("order", "genus")
ranks("> genus")

nms("Poaceae")
nms("Poaceae", "Poa")
nms("< Poaceae")

ids(4544)
ids(4544, 4479)
ids("< 4479")



