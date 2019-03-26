library(riverdist)


### Name: upstream
### Title: Upstream River Distance
### Aliases: upstream

### ** Examples

data(Gulk)

# Mouth must be specified
Gulk$mouth$mouth.seg <- 1
Gulk$mouth$mouth.vert <- 1

plot(x=Gulk)
riverpoints(seg=c(6,4), vert=c(140,140), pch=16, col=2, rivers=Gulk)
upstream(startseg=6, endseg=4, startvert=140, endvert=40, rivers=Gulk, net=TRUE)
upstream(startseg=6, endseg=4, startvert=140, endvert=40, rivers=Gulk, net=FALSE)
upstream(startseg=6, endseg=4, startvert=140, endvert=40, rivers=Gulk, flowconnected=TRUE)



