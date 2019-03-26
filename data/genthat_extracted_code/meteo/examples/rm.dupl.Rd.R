library(meteo)


### Name: rm.dupl
### Title: Find point pairs with equal spatial coordinates from STFDF
###   object.
### Aliases: rm.dupl

### ** Examples

# load observation - data frame
data(dtempc) 
# load stations - data frame
data(stations)

str(dtempc)
str(stations)
# create STFDF
temp <- meteo2STFDF(dtempc,stations) # create STFDF from 2 data frames

nrow(temp@sp) # number of stations before removing dupl.

temp2 <-rm.dupl(temp)
nrow(temp2@sp) # number of stations after



