library(riverdist)


### Name: splitsegments
### Title: Split Segments by Endpoint Proximity
### Aliases: splitsegments

### ** Examples

data(Koyukuk1)
topologydots(rivers=Koyukuk1)
# Segments 7, 8, 13, and 16 need to be split so topologies will work.  
# Since endpoints are not in the same place, they are not detected as 
# being connected.
plot(x=Koyukuk1)

Koyukuk1split <- splitsegments(rivers=Koyukuk1)
topologydots(rivers=Koyukuk1split)
plot(x=Koyukuk1split)

# if only segment 17 were to be split in three places
plot(x=splitsegments(rivers=Koyukuk1, splitthese=c(7,7,7),
        splitthemat=c(14,5,12)))
        
# if only segment 16 were to be split, showing behavior of append=
plot(x=splitsegments(rivers=Koyukuk1, splitthese=c(7,7,7),
        splitthemat=c(14,5,12), append=TRUE))



