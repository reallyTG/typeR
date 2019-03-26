library(breakpoint)


### Name: CE.Normal.Mean
### Title: Multiple Break-point Detection via the CE Method for Continuous
###   Data (Mean levels)
### Aliases: CE.Normal.Mean

### ** Examples

data(ch1.GM03563)
## Not run: 
##D ## CE with four parameter beta distribution with mBIC as the selection criterion  ##
##D obj1 <- CE.Normal.Mean(ch1.GM03563, distyp = 1, penalty = "mBIC", parallel =TRUE)
##D profilePlot(obj1, simdata)
##D 
##D ## CE with truncated normal distribution with mBIC as the selection criterion  ##
##D obj2 <- CE.Normal.Mean(ch1.GM03563, distyp = 2, penalty = "mBIC", parallel =TRUE)
##D profilePlot(obj2, simdata)
## End(Not run)



