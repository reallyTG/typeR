library(wql)


### Name: mts2ts
### Title: Converts matrix to vector time series for various analyses
### Aliases: mts2ts
### Keywords: manip ts

### ** Examples


## Quick plot a spatial transect of chlorophyll a during the 
## spring bloom period (Feb-Apr) for each year.
y <- mts2ts(sfbayChla, seas = 2:4)
plot(y, type = 'n')
abline(v = 1978:2010, col = 'lightgrey')
lines(y, type = 'h')




