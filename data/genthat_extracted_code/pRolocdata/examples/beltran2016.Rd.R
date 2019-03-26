library(pRolocdata)


### Name: beltran2016
### Title: Data from Beltran et al. 2016
### Aliases: beltran2016 beltran2016HCMV24 beltran2016HCMV48
###   beltran2016HCMV72 beltran2016HCMV96 beltran2016HCMV120
###   beltran2016MOCK24 beltran2016MOCK48 beltran2016MOCK72
###   beltran2016MOCK96 beltran2016MOCK120
### Keywords: datasets

### ** Examples

## load the two 24 hours datasets
data(beltran2016MOCK24)
data(beltran2016HCMV24)
beltran2016MOCK24
beltran2016HCMV24

## the expression data
head(exprs(beltran2016MOCK24))
head(exprs(beltran2016HCMV24))

## abstract
abstract(beltran2016HCMV24)

## plotting
library("pRoloc")
par(mfrow = c(1, 2))
plot2D(beltran2016HCMV24, main = "HCMV 24hpi")
plot2D(beltran2016MOCK24, main = "MOCK 24hpi")

## Combine the date as a list and keep only common features
ml <- MSnSetList(list(beltran2016HCMV24, beltran2016MOCK24))
ml <- commonFeatureNames(ml)

par(mfrow = c(1, 2))
plot2D(ml[[1]], main = "HCMV 24hpi")
plot2D(ml[[2]], main = "MOCK 24hpi")




