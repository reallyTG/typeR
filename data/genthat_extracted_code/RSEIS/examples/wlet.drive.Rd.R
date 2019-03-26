library(RSEIS)


### Name: wlet.drive
### Title: Interactive wavelet transform driver
### Aliases: wlet.drive
### Keywords: iplot

### ** Examples



data(CE1)
plot(CE1$x, CE1$y, type='l')

if(interactive() ) wlet.drive(CE1$y, CE1$dt, STAMP=CE1$name)






