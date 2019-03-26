library(FSMUMI)


### Name: Creating_gaps
### Title: Creating gaps in multivariate time series
### Aliases: Creating_gaps

### ** Examples

data(dataFSMUMI)
X <- dataFSMUMI[1:5000,]; #reduction for demo
rate <- 0.1
ngaps <- 1
incompleted_signal <- Creating_gaps(X, rate,1)



