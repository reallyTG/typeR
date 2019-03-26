library(ectotemp)


### Name: calculate_Ex
### Title: Exploitation of the thermal environment
### Aliases: calculate_Ex

### ** Examples

te <- na.omit(ichalp[,"te"])
tb <- na.omit(ichalp[,"tb"])
Ex <- calculate_Ex(te, tb, 14.44, 18.33)




