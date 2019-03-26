library(hydroGOF)


### Name: plotbandsonly
### Title: Adds uncertainty bounds to an existing plot.
### Aliases: plotbandsonly
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
##D plot(obs, type="n")
##D plotbandsonly(lband, uband)
##D points(obs, col="blue", cex=0.6, type="o")
## End(Not run)




