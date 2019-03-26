library(GSIF)


### Name: soil.classes
### Title: Soil classification tables
### Aliases: soil.classes
### Keywords: datasets

### ** Examples

data(soil.classes)
soil.classes$USDA_GreatGroups[1,]
DGC <- which(soil.classes$Canadian$CSSC_Great_Groups=="Dark Gray Chernozem")
soil.classes$Canadian[DGC,]



