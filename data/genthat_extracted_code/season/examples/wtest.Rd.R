library(season)


### Name: wtest
### Title: Walter and Elwood's Test of Seasonality
### Aliases: wtest

### ** Examples

data(stillbirth)
# tabulate the total number of births and the number of stillbirths
freqs = table(stillbirth$month,stillbirth$stillborn)
data = list()
data$trials = as.numeric(freqs[,1]+freqs[,2])
data$success = as.numeric(freqs[,2])
# test for a seasonal pattern in stillbirth
test = wtest(cases='success', offset='trials', data=data)



