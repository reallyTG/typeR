library(bcpmeta)


### Name: simgen
### Title: Generate Simulation Data
### Aliases: simgen
### Keywords: package changepoint MCMC

### ** Examples

## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times



