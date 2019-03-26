library(highfrequency)


### Name: rQuar
### Title: Realized quarticity of highfrequency return series.
### Aliases: rQuar
### Keywords: highfrequency rQuar

### ** Examples

data(sample_tdata)
rQuar(rdata= sample_tdata$PRICE, align.by= "minutes", align.period =5, makeReturns= TRUE)
rQuar



