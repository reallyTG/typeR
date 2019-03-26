library(mvngGrAd)


### Name: movingGrid
### Title: Moving Grid Adjustment In Plant Breeding Field Trials
### Aliases: movingGrid
### Keywords: design

### ** Examples


### data creation ###
#####################


### The field plan consists of 50 rows and 50 columns
### (= 2500 cells = 2500 entries)

## row vector

rows <- rep(1:50,each=50)


## column vector
cols <- rep(1:50,50)

## simulation of growing conditions with a horizontal gradient between
## the rows and some random noise within

set.seed(666)
growingCond <- rep(1:50,each=50) + rnorm(2500)

## simulation of the genotypic effects
gEffects <- rnorm(2500,mean=0,sd=5)

## observed phenotypic values
yield <- growingCond + gEffects

## adjustment with movingGrid

cross <- list(c(1),
              c(1),
              c(1:4),
              c(1:4))

exampleResults <- movingGrid(rows = rows,
                             columns = cols,
                             obsPhe = yield,
                             shapeCross = cross,
                             layers = c(1,2),
                             excludeCenter = TRUE)

## a summary

summary(exampleResults)

## the adjusted phenotypic values of the first 25 entries

fitted(exampleResults)[1:25]

## all information on entry, for the first 25

entryData(exampleResults)[1:25,]

## moving means for the first 25

movingMean(exampleResults)[1:25]




