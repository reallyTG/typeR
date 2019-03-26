library(waved)


### Name: threshsum
### Title: Show threshold effects
### Aliases: threshsum
### Keywords: internal

### ** Examples

library(waved)
data=waved.example(TRUE,FALSE)
doppler.wvd=WaveD(data$doppler.noisy,data$g)
threshsum(doppler.wvd$w,3,8)




