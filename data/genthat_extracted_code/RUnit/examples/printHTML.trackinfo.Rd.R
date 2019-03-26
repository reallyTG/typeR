library(RUnit)


### Name: printHTML.trackInfo
### Title: Write HTML pages of the tracking result.
### Aliases: printHTML.trackInfo printHTML
### Keywords: programming

### ** Examples


##  example function
foo <- function(x){
   y <- 0
   for(i in 1:100)
   {
      y <- y + i
   }
   return(y)
}

##  the name track is necessary
track <- tracker()

##  initialize the tracker
track$init()

##  inspect the function
##  res is the result of foo
res <- inspect(foo(10), track = track)

##  get the tracking info
resTrack <- track$getTrackInfo()

##  create HTML pages
printHTML.trackInfo(resTrack)



