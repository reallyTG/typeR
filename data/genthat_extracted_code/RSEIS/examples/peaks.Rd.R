library(RSEIS)


### Name: peaks
### Title: Peaks
### Aliases: peaks
### Keywords: misc

### ** Examples


data(CE1)
plot(CE1$x, CE1$y, type='l')


pp <- seq(from=53, to=80, by=1)

plot(CE1$x[pp], CE1$y[pp], type='l')


aa <- peaks(CE1$y[pp], span=3)


abline(v=CE1$x[pp[aa]], col='red')






