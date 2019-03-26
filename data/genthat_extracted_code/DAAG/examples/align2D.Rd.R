library(DAAG)


### Name: align2D
### Title: Function to align points from ordination with known locations
### Aliases: align2D
### Keywords: dplot algebra

### ** Examples

if(require(DAAG)&require(oz)){
aupts <- cmdscale(audists)
xy <- align2D(lat = aulatlong$latitude, long = aulatlong$longitude,
              x1 = aupts[, 1], x2 = aupts[, 2], wts = NULL)
oz()
fitcoords <- align2D(lat=aulatlong$latitude,
                      long=aulatlong$longitude,
                      x1=aupts[,1], x2 = aupts[,2],
                      wts=NULL)
x <-with(fitcoords,
         as.vector(rbind(lat, fitlat, rep(NA,length(lat)))))
y <-with(fitcoords,
         as.vector(rbind(long, fitlong, rep(NA,length(long)))))
points(aulatlong, col="red", pch=16, cex=1.5)
lines(x, y, col="gray40", lwd=3)
}

## The function is currently defined as
function(lat, long, x1, x2, wts=NULL){
    ## Get best fit in space of (latitude, longitude)
    if(is.null(wts))wts <- rep(1,length(x1))
    fitlat <- predict(lm(lat ~ x1+x2, weights=wts))
    fitlong <- predict(lm(long ~ x1+x2, weights=wts))
    list(fitlat = fitlat, fitlong=fitlong, lat=lat, long=long)
}



