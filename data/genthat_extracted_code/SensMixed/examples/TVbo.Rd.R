library(SensMixed)


### Name: TVbo
### Title: TV dataset
### Aliases: TVbo
### Keywords: datasets

### ** Examples

## import SensMixed package
library(SensMixed)

## convert some variables to factors in TVbo
TVbo <- convertToFactors(TVbo, c("Assessor", "Repeat", "Picture"))

## run automated selection process
res <- sensmixed(c("Coloursaturation", "Colourbalance"),
prod_effects = c("TVset", "Picture"), 
assessor="Assessor", data=TVbo, MAM=FALSE)
res




