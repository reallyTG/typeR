library(riverdist)


### Name: plothomerangeoverlap
### Title: Plot Home Range Overlap
### Aliases: plothomerangeoverlap

### ** Examples

data(Gulk, fakefish)
ranges <- with(fakefish, homerange(unique=fish.id, survey=flight, seg=seg, vert=vert, rivers=Gulk))
ranges

# 19 plots will be produced, recommend calling par(mfrow=c(4,5))
plot(ranges)
plot(ranges,cumulative=TRUE,label=TRUE)

homerangeoverlap(ranges)

plothomerangeoverlap(ranges)
with(fakefish, riverpoints(seg=seg, vert=vert, rivers=Gulk))



