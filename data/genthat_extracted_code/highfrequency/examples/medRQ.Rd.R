library(highfrequency)


### Name: medRQ
### Title: An estimator of integrated quarticity from applying the median
###   operator on blocks of three returns.
### Aliases: medRQ
### Keywords: highfrequency medRQ

### ** Examples

data(sample_tdata)
medRQ(rdata= sample_tdata$PRICE, align.by= "minutes", align.period =5, makeReturns= TRUE)
medRQ



