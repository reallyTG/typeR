library(highfrequency)


### Name: minRQ
### Title: An estimator of integrated quarticity from applying the minimum
###   operator on blocks of two returns.
### Aliases: minRQ
### Keywords: highfrequency minRQ

### ** Examples

data(sample_tdata)
minRQ(rdata= sample_tdata$PRICE, align.by= "minutes", align.period =5, makeReturns= TRUE)
minRQ



