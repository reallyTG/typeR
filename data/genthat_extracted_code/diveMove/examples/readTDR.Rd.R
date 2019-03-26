library(diveMove)


### Name: readTDR
### Title: Read comma-delimited file with "TDR" data
### Aliases: readTDR createTDR
### Keywords: manip

### ** Examples


## Do example to define object zz with location of dataset
utils::example("dives", package="diveMove",
               ask=FALSE, echo=FALSE)
srcfn <- basename(zz)
readTDR(zz, speed=TRUE, sep=";", na.strings="", as.is=TRUE)

## Or more pedestrian
tdrX <- read.csv(zz, sep=";", na.strings="", as.is=TRUE)
date.time <- paste(tdrX$date, tdrX$time)
tdr.time <- as.POSIXct(strptime(date.time, format="%d/%m/%Y %H:%M:%S"),
                       tz="GMT")
createTDR(tdr.time, tdrX$depth, concurrentData=data.frame(speed=tdrX$speed),
          file=srcfn, speed=TRUE)




