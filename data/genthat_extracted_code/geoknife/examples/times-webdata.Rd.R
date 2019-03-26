library(geoknife)


### Name: times
### Title: the times of an webdata object
### Aliases: times times<- times<-,webdata-method times,webdata-method

### ** Examples

wd <- webdata('prism')
times(wd) <- as.POSIXct(c("2012-11-04", "2012-11-12"))
times(wd)[1] <- as.POSIXct("2012-11-04")
times(wd)



