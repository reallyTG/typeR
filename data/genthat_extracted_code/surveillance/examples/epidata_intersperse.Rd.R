library(surveillance)


### Name: epidata_intersperse
### Title: Impute Blocks for Extra Stops in '"epidata"' Objects
### Aliases: intersperse
### Keywords: spatial manip

### ** Examples

data("fooepidata")
subset(fooepidata, start < 25 & stop > 25, select = 1:7)
nrow(fooepidata)
moreStopsEpi <- intersperse(fooepidata, c(25,75))
nrow(moreStopsEpi)
subset(moreStopsEpi, stop == 25 | start == 25, select = 1:7)



