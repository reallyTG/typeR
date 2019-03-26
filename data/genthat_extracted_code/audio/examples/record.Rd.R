library(audio)


### Name: record
### Title: Record audio
### Aliases: record
### Keywords: interface

### ** Examples

## No test: 
x <- rep(NA_real_, 16000)
# start recording into x
record(x, 8000, 1)
# monitor the recording progress
par(ask=FALSE) # for continuous plotting
while (is.na(x[length(x)])) plot(x, type='l', ylim=c(-1, 1))
# play the recorded audio
play(x)
## End(No test)



