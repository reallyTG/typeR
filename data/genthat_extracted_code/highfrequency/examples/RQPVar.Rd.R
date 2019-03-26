library(highfrequency)


### Name: rQPVar
### Title: Realized quad-power variation of highfrequency return series.
### Aliases: rQPVar
### Keywords: highfrequency rQPVar

### ** Examples

data(sample_tdata)
rQPVar(rdata= sample_tdata$PRICE, align.by= "minutes", align.period =5, makeReturns= TRUE)
rQPVar



