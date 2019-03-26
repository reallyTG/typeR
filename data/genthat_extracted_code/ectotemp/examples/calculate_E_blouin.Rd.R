library(ectotemp)


### Name: calculate_E_blouin
### Title: Thermoregulation effectiveness sensu Blouin-Demers & Weatherhead
### Aliases: calculate_E_blouin

### ** Examples

te <- na.omit(bufbuf[,"te"])
tb <- na.omit(bufbuf[,"tb"])
E <- calculate_E_blouin(te, tb, 19.35, 26.44)




