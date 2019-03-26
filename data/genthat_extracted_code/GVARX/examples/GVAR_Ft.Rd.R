library(GVARX)


### Name: GVAR_Ft
### Title: Function to generate foreign variables
### Aliases: GVAR_Ft

### ** Examples

#=== Loading Data ===#
data("PriceVol")
data("tradeweight1")
data("tradeweightx")

#Generate country-specific foreign variables
Ft=GVAR_Ft(data=PriceVol,weight.matrix=tradeweight1)
k=17
head(Ft[[k]])
tail(Ft[[k]])



