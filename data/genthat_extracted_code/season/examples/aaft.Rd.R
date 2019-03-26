library(season)


### Name: aaft
### Title: Amplitude Adjusted Fourier Transform (AAFT)
### Aliases: aaft

### ** Examples

## No test: 
data(CVD)
surr = aaft(CVD$cvd, nsur=1)
plot(CVD$cvd, type='l')
lines(surr[,1], col='red')
## End(No test)



