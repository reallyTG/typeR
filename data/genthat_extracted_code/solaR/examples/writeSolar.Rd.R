library(solaR)


### Name: D_writeSolar-methods
### Title: Exporter of solaR results
### Aliases: writeSolar writeSolar-methods writeSolar,Sol-method
### Keywords: methods

### ** Examples


lat <- 37.2;
G0dm <- c(2766, 3491, 4494, 5912, 6989, 7742, 7919, 7027, 5369, 3562, 2814, 2179)
Ta <- c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2, 15.2)
prom <- list(G0dm=G0dm, Ta=Ta)

prodFixed <- prodGCPV(lat=lat, dataRad=prom, modeRad='aguiar', keep.night=FALSE)

old <- setwd(tempdir())

writeSolar(prodFixed, 'prodFixed.csv')

dir()

zI <- read.zoo("prodFixed.csv",
               header = TRUE, sep = ",",
               FUN = as.POSIXct)

zD<- read.zoo("prodFixed.D.csv",
               header = TRUE, sep = ",")

zD<- read.zoo("prodFixed.D.csv",
               header = TRUE, sep = ",",
               FUN = as.yearmon)

setwd(old)



