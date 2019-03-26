library(LSTS)


### Name: periodogram
### Title: Periodogram function
### Aliases: periodogram timeseries Fourier
### Keywords: periodogram Fourier timeseries

### ** Examples

## Require "rdatamarket"
library(rdatamarket)

## Database
malleco = dmlist("22tn")
mammothcreek = dmlist("22r7")

periodogram(malleco$Value)
periodogram(mammothcreek$Value)



