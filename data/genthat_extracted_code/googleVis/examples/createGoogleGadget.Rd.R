library(googleVis)


### Name: createGoogleGadget
### Title: Create a Google Gadget
### Aliases: createGoogleGadget
### Keywords: intreface

### ** Examples

M <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
gdgt <- createGoogleGadget(M)
cat(gdgt)



