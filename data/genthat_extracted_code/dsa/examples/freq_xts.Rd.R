library(dsa)


### Name: freq_xts
### Title: Obtain the frequency of an xts time series
### Aliases: freq_xts

### ** Examples

x <- xts::xts(rnorm(100), seq.Date(from=as.Date("2010-01-01"), by="months", length.out=100))
frequency(x)



