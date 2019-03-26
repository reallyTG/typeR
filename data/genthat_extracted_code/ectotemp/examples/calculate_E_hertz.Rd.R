library(ectotemp)


### Name: calculate_E_hertz
### Title: Calculate thermoregulation effectiveness sensu Hertz, Huey &
###   Stevenson
### Aliases: calculate_E_hertz

### ** Examples

te <- na.omit(bufbuf[,"te"])
tb <- na.omit(bufbuf[,"tb"])
E <- calculate_E_hertz(te, tb, 19.35, 26.44)




