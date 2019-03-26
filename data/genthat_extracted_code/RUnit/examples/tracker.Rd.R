library(RUnit)


### Name: tracker
### Title: Tracking the results of the inspect process.
### Aliases: tracker
### Keywords: programming

### ** Examples


## example functions
foo <- function(x){
   y <- 0
   for(i in 1:100)
   {
      y <- y + i
   }
   return(y)
}

bar <- function(x){
   y <- 0
   for(i in 1:100)
   {
      y <- y - i
   }
   return(y)
}



##  the object name track is 'fixed' (current implementation)
track <- tracker()

##  initialize the tracker
track$init()

##  inspect the function
##  resFoo1 will contain the result of calling foo(50)
resFoo1 <- inspect(foo(50), track = track)

resFoo2 <- inspect(foo(20), track = track)

resBar1 <- inspect(bar(30), track = track)

##  get the tracked function call info for all inspect calls
resTrack <- track$getTrackInfo()

##  create HTML sites in folder ./results for all inspect calls
printHTML.trackInfo(resTrack)



