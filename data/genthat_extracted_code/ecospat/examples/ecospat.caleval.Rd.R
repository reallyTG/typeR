library(ecospat)


### Name: ecospat.caleval
### Title: Calibration And Evaluation Dataset
### Aliases: ecospat.caleval

### ** Examples

data <- ecospat.testData
caleval <- ecospat.caleval (data = ecospat.testData[53], xy = data[2:3], row.num = 1:nrow(data), 
nrep = 2, ratio = 0.7, disaggregate = 0.2, pseudoabs = 100, npres = 10, replace = FALSE)
caleval



