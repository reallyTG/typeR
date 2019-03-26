library(ACSWR)


### Name: insurance
### Title: Insurance Claims Data
### Aliases: insurance
### Keywords: time series plot

### ** Examples

data(insurance)
plot(insurance$Claim,insurance$Days,"l",xlab="Claim Sequence",
   ylab="Time to Settle the Claim")
title("B: Run Chart for Insurance Claim Settlement")



