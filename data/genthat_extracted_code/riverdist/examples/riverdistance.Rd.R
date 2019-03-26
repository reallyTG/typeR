library(riverdist)


### Name: riverdistance
### Title: River Distance
### Aliases: riverdistance

### ** Examples

data(Gulk)
riverdistance(startseg=6, endseg=14, startvert=100, endvert=200, rivers=Gulk)
riverdistance(startvert=100, endvert=200, path=c(6,3,4,10,11,14), rivers=Gulk)
riverdistance(startseg=6, endseg=14, startvert=100, endvert=200, rivers=Gulk, map=TRUE)
      
# speed comparison: 

data(abstreams)

tstart <- Sys.time()
riverdistance(startseg=120, startvert=10, endseg=131, endvert=10, rivers=abstreams, 
              algorithm="sequential")
Sys.time()- tstart

tstart <- Sys.time()
riverdistance(startseg=120, startvert=10, endseg=131, endvert=10, rivers=abstreams, 
              algorithm="Dijkstra")
Sys.time()- tstart

tstart <- Sys.time()
riverdistance(startseg=120, startvert=10, endseg=131, endvert=10, rivers=abstreams)

# Note: it is not necessary to specify the algorithm here: the distance function
# will automatically select the fastest algorithm unless otherwise specified.
Sys.time()- tstart




