library(highfrequency)


### Name: rSV
### Title: Realized semivariance of highfrequency return series.
### Aliases: rSV
### Keywords: highfrequency rSV

### ** Examples

data(sample_tdata)
rSV(sample_tdata$PRICE,align.by ="minutes", align.period =5, makeReturns = TRUE)



