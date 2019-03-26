library(bcpmeta)


### Name: bcpmeta.parameters
### Title: Estimate Model Parameters under a Given Configuration
### Aliases: bcpmeta.parameters
### Keywords: package changepoint MCMC

### ** Examples

## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times

## Parameter estimation in the configuration where changepoints are time 50 and 99.
results = bcpmeta.parameters(X, meta = meta, eta = c(50, 99), trend = FALSE);  



