library(riverdist)


### Name: isflowconnected
### Title: Check Flow-Connectedness
### Aliases: isflowconnected

### ** Examples

data(Gulk)
plot(Gulk)

Gulk <- setmouth(seg=1, vert=1, rivers=Gulk)

isflowconnected(seg1=13, seg2=14, rivers=Gulk)
isflowconnected(seg1=13, seg2=1, rivers=Gulk)



