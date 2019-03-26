library(riverdist)


### Name: riverdistancelist
### Title: Multiple River Distances
### Aliases: riverdistancelist

### ** Examples

data(KilleyW)
plot(x=KilleyW)

Killey.dists <- riverdistancelist(startseg=1, endseg=16, startvert=100, endvert=25,
   rivers=KilleyW, reps=1000)
Killey.dists  # 18 routes are detected.

# mapping the shortest route detected... 
riverdistance(startvert=100, endvert=25, path=Killey.dists$routes[[1]], rivers=KilleyW, map=TRUE)

# mapping the shortest longest detected... 
riverdistance(startvert=100, endvert=25, path=Killey.dists$routes[[18]], rivers=KilleyW, map=TRUE)



