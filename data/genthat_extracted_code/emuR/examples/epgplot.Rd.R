library(emuR)


### Name: epgplot
### Title: Plot palatographic data
### Aliases: epgplot
### Keywords: dplot

### ** Examples


epgplot(polhom.epg[10,])

# as above but between times 1295 ms and 1330 ms
epgplot(polhom.epg[10,], xlim=c(1295, 1330))

# the same as above, but the data is first
# converted to a 3D palatographic array
p <- palate(polhom.epg[10,])
epgplot(p, xlim=c(1295, 1330))

# plot palatograms 2 and 8
epgplot(p[,,c(2, 8)])

# as above but
# no gridlines, different colour, numbering rather than times
epgplot(p[,,c(2, 8)], gridlines=FALSE, col="pink", numbering=TRUE)

# as above but with a user-specified title

epgplot(p[,,c(2, 8)], gridlines=FALSE, col="pink", numbering=c("s1", "s2"))

# plot the palatograms in the second
# segment of coutts.epg that are closest in time
# to 16377 ms and 16633 ms
epgplot(coutts.epg[2,], c(16377, 16633))





