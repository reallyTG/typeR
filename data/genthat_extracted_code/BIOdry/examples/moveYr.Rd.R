library(BIOdry)


### Name: moveYr
### Title: Seasonal years
### Aliases: moveYr

### ** Examples

## Climatic records of monthly precipitation sums and monthly
## average temperatures
data(PTclim05,envir = environment())

## Making the year 1955 in plot 'P16106' to begin on 'April'
cl1 <- slitFrame(PTclim05,c('year','plot'))[[1]]
cl2 <- moveYr(cl1,ini.mnt = 'Mar')
head(cl2)

## a simple vector of years
yr <- rep(2005,12)
names(yr) <- month.abb[1:12]
moveYr(yr)




