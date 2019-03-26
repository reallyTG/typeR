library(scholar)


### Name: get_impactfactor
### Title: Get journal metrics.
### Aliases: get_impactfactor

### ** Examples

library(scholar)

id <- get_publications("bg0BZ-QAAAAJ&hl")
impact <- get_impactfactor(journals=id$journal, max.distance = 0.1)

id <- cbind(id, impact)




