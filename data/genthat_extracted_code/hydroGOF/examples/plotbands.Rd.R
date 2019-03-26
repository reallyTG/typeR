library(hydroGOF)


### Name: plotbands
### Title: Plot a ts with observed values and two confidence bounds
### Aliases: plotbands
### Keywords: dplot

### ** Examples

# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Selecting only the daily values belonging to the year 1961
obs <- window(obs, end=as.Date("1961-12-31"))

# Generating the lower and upper uncertainty bounds
lband <- obs - 5
uband <- obs + 5

## Not run: 
##D plotbands(obs, lband, uband)
## End(Not run)

# Randomly generating a simulated time series
sim <- obs + rnorm(length(obs), mean=3)

## Not run: 
##D plotbands(obs, lband, uband, sim)
## End(Not run)




