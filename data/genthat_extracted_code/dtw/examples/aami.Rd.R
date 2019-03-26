library(dtw)


### Name: aami
### Title: ANSI/AAMI EC13 Test Waveforms, 3a and 3b
### Aliases: aami3a aami3b
### Keywords: datasets

### ** Examples


data(aami3a);
data(aami3b);

## Plot both as a multivariate TS object
##  only extract the first 10 seconds

plot( main="ECG (mV)",
 window(
  cbind(aami3a,aami3b)   ,end=10)
)






