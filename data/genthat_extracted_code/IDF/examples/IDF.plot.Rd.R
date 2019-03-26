library(IDF)


### Name: IDF.plot
### Title: Plotting IDF curves
### Aliases: IDF.plot

### ** Examples

RR <- rgamma(10*30*24,shape=1)
year <- sort(rep(1:(10),30*24))
data <- data.frame(RR,year)
fit <- IDF.fit(data)
param <- fit$par
IDF.plot(pars=param,st.name="example",dt.name="rgamma")



