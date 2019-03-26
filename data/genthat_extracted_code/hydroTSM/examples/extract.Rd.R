library(hydroTSM)


### Name: extract
### Title: Extract from Zoo
### Aliases: extract extract.default extract.zoo extractzoo
### Keywords: manip

### ** Examples

### Loading temperature data ##
data(SanMartinoPPts)
x <- SanMartinoPPts

## Extracting all the values belonging to February (FEB=2)
extract(x, trgt=2)

## Extracting all the values belonging to February (FEB=2) and April (APR=4)
extract(x, trgt=c(2,4))

## Extracting all the values belonging to the year 1970
extract(x, trgt=1970)

## Extracting all the values belonging to the years 1970 and 1972
extract(x, trgt=c(1970,1972))

## Extracting all the values belonging to the autumn
extract(x, trgt="SON")



