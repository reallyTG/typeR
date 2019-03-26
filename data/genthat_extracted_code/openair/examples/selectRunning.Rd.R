library(openair)


### Name: selectRunning
### Title: Function to extract run lengths greater than a threshold
### Aliases: selectRunning
### Keywords: methods

### ** Examples


## extract those hours where there are at least 5 consecutive NOx
## concentrations above 500ppb

mydata <- selectRunning(mydata, run.len = 5, threshold = 500)

## make a polar plot of those conditions...shows that those
## conditions are dominated by low wind speeds, not
## in-canyon recirculation
## Not run: polarPlot(mydata, pollutant = "nox")




