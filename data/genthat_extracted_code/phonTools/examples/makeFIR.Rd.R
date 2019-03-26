library(phonTools)


### Name: makeFIR
### Title: Create a Digital Filter
### Aliases: makeFIR

### ** Examples


## specify a filter with an arbitrary response
frequency = c(0, 500, 502, 5000, 5002, 7000, 7002, 11025)
dB = c(0, 0, -50,  -50, -10,  -10, -70, -70)

## create the filter and verify that the frequency response is as desired
testfilter = makeFIR (frequency, dB, verify = TRUE, order = 1500)
spectralslice (testfilter, padding = 1000)


## create the filter and verify that the frequency response is as desired
makeFIR (frequency, dB, verify = TRUE, order = 300, signal = rnorm (1400))




