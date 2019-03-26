library(adehabitatLT)


### Name: runsNAltraj
### Title: Highlighting the Patterns in Missing Values in Trajects
### Aliases: runsNAltraj summaryNAltraj plotNAltraj
### Keywords: hplot NA

### ** Examples


## Two relocations are theoretically separated by
## 10 minutes (600 seconds)
data(puechcirc)
puechcirc

## plot the missing values
plotNAltraj(puechcirc)


## Test for an autocorrelation pattern in the missing values
(runsNAltraj(puechcirc))




