library(emuR)


### Name: epgsum
### Title: Sum contacts in palatograms.
### Aliases: epgsum
### Keywords: math

### ** Examples


# Trackdata object of the sum of contacts in the 1st segment of polhom.epg
epgsum(polhom.epg[1,])
# as above, but the summation is in rows 1-3 only.
epgsum(polhom.epg[1,], rows=c(1:3))
# as epgsum(polhom.epg[1,]), except sum the inactive electrodes in columns 3-6.
epgsum(polhom.epg[1,], columns=3:6, inactive=TRUE)
# Obtain compressed EPG-trackdata object for the 1st four segments of polhom.epg
# at the temporal midpoint
mid <- dcut(polhom.epg[1:4,], .5, prop=TRUE)
# sum of contacts in these four palatograms.
epgsum(mid)
# gives the same result as the previous command.
p <- palate(mid)
# sum the contacts in the palatograms.
epgsum(p)
# as above, but show the separate row summmations. 
epgsum(p, 1)
# as above, but show the separate column summmations. 
epgsum(p, 2)
# sum of the contacts in rows 1-4 showing the separate row summations.
epgsum(p, 1, rows=1:4)
# sum of the contacts in rows 1-4 showing the separate column summations.
epgsum(p, 2, rows=1:4)
# sum of the contacts in columns 3-6  showing the separate row summations.
epgsum(p, 1, columns=3:6)
# sum of the contacts in columns 3-6  showing the separate column summations.
epgsum(p, 2, columns=3:6)





