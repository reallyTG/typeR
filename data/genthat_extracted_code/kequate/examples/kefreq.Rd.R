library(kequate)


### Name: kefreq
### Title: Test Score Frequency Tabulation
### Aliases: kefreq

### ** Examples

freqdata <- data.frame(X=c(1,2,2,1,2,2,2,2,3,1,2,1,4,2,1,1,3,3,3,3), 
A=(c(0,2,1,1,0,3,1,2,2,0,2,0,3,1,1,2,2,2,1,2)))
Pdata <- kefreq(freqdata$X, 0:5, freqdata$A, 0:3)



