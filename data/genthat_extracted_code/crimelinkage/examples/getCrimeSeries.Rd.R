library(crimelinkage)


### Name: getCrimeSeries
### Title: Generate a list of offenders and their associated crime series.
### Aliases: getCrimeSeries

### ** Examples

data(offenders)

 getCrimeSeries("O:40",offenders)
 getCrimeSeries(c("O:40","O:3"),offenders)  # list of crime series from multiple offenders



