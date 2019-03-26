library(waved)


### Name: WaveD
### Title: WaveD
### Aliases: WaveD
### Keywords: nonparametric

### ** Examples

library(waved)
data=waved.example(TRUE,FALSE)
doppler.wvd=WaveD(data$doppler.noisy,data$g)
summary(doppler.wvd)



