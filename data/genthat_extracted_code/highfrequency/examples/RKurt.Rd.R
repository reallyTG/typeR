library(highfrequency)


### Name: rKurt
### Title: Realized kurtosis of highfrequency return series.
### Aliases: rKurt
### Keywords: highfrequency rKurt

### ** Examples

data(sample_tdata)
rKurt(sample_tdata$PRICE,align.by ="minutes", align.period =5, makeReturns = TRUE)



