library(bcpmeta)


### Name: bcpmeta.model
### Title: Identify the Optimal Changepoint Configuration
### Aliases: bcpmeta.model
### Keywords: package changepoint MCMC

### ** Examples

## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times

## For illustration purpose, number of MCMC iteration is set to a small value.
results = bcpmeta.model(X, meta = meta, iter = 1e3, trend = FALSE); 



