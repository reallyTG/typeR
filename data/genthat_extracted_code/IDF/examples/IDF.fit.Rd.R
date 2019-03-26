library(IDF)


### Name: IDF.fit
### Title: Fitting IDF model parameters to observations at different
###   durations
### Aliases: IDF.fit

### ** Examples

RR <- rgamma(10*30*24,shape=1)
year <- sort(rep(1:(10),30*24))
data <- data.frame(RR,year)
fit <- IDF.fit(data)
pars <- fit$par 



