library(highfrequency)


### Name: rTPVar
### Title: Realized tri-power variation of highfrequency return series.
### Aliases: rTPVar
### Keywords: highfrequency rTPVar

### ** Examples

data(sample_tdata)
rTPVar(rdata= sample_tdata$PRICE, align.by= "minutes", align.period =5, makeReturns= TRUE)
rTPVar



