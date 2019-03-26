library(RUnit)


### Name: inspect
### Title: Track the executed code lines of a function or method.
### Aliases: inspect
### Keywords: programming

### ** Examples


## example function
foo <- function(x){
   y <- 0
   for(i in 1:100)
   {
      y <- y + i
   }
   return(y)
}

## the name track is necessary
track <- tracker()

## initialize the tracker
track$init()

## inspect the function
## res will collect the result of calling foo
res <- inspect(foo(10), track = track)

## get the tracked function call info
resTrack <- track$getTrackInfo()

## create HTML sites
printHTML.trackInfo(resTrack)



