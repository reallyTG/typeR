library(highfrequency)


### Name: rMPV
### Title: Realized multipower variation (MPV), an estimator of integrated
###   power variation.
### Aliases: rMPV
### Keywords: highfrequency rMPV

### ** Examples

data(sample_tdata)
rMPV(sample_tdata$PRICE, m=2, p=3, align.by= "minutes", align.period=5,makeReturns= TRUE)



