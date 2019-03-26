library(metamisc)


### Name: oecalc
### Title: Calculate the total O:E ratio
### Aliases: oecalc
### Keywords: calibration meta-analysis performance

### ** Examples

######### Validation of prediction models with a binary outcome #########
data(EuroSCORE)

# Calculate the total O:E ratio and its standard error
oecalc(O=n.events, E=e.events, N=n, data=EuroSCORE, slab=Study)

# Calculate the log of the total O:E ratio and its standard error
oecalc(O=n.events, E=e.events, N=n, data=EuroSCORE, slab=Study, g="log(OE)")




