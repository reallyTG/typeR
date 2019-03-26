library(tracheideR)


### Name: getTrac
### Title: Compute tracheidograms
### Aliases: getTrac

### ** Examples

## Not run:
y2010ray1 <- getTrac(tch$y2010$ray1, scale = 0.169)
y2010 <- getTrac(tch$y2010, scale = 0.169)
TCH <- lapply(tch,getTrac, scale = 0.169)
TCH$y2010$ray1$n #number of tracheids in ray1 in the year 2010
TCH$y2010$ray1$pos$RingWidth #number of tracheids in ray1 in the year 2010
#getTrac(tch$y2010$ray2, scale = 0.169)
#getTrac(data.frame(tch$y2010$ray2), scale=0.169)
## End(Not run)



