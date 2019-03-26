library(hts)


### Name: accuracy.gts
### Title: In-sample or out-of-sample accuracy measures for forecast
###   grouped and hierarchical model
### Aliases: accuracy.gts
### Keywords: error

### ** Examples


data <- window(htseg2, start = 1992, end = 2002)
test <- window(htseg2, start = 2003)
fcasts <- forecast(data, h = 5, method = "bu")
accuracy(fcasts, test)
accuracy(fcasts, test, levels = 1)




