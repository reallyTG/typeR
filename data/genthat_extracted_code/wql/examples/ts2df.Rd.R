library(wql)


### Name: ts2df
### Title: Convert time series to data frame
### Aliases: ts2df
### Keywords: manip ts

### ** Examples


# San Francisco Bay station 27 chlorophyll has the lowest serial 
# correlation in Oct-Nov, with Sep-Oct a close second
chl27 <- sfbayChla[, 's27']
monthCor(chl27)

# Convert to a data frame with October, the first month of the 
# local "water year", in the first column
tsp(chl27)
chl27 <- round(chl27, 1)
ts2df(chl27, mon1 = 10, addYr = TRUE)
ts2df(chl27, mon1 = 10, addYr = TRUE, omit = TRUE)




