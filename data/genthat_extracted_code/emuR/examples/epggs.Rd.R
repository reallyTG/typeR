library(emuR)


### Name: epggs
### Title: Plot a grey-scale image of palatographic data.
### Aliases: epggs
### Keywords: dplot

### ** Examples


# greyscale image across the first two segments 'just relax'
# with title
epggs(coutts.epg[1:2,], main="just relax")

# as above but with dotted gridlines in blue
epggs(coutts.epg[1:2,], main="just relax", gridlty=2, gridcol="blue")

# as the first example, but with greyscale set to 2
epggs(coutts.epg[1:2,], 2, main="just relax")

# get palatograms for "S" from the polhom.epg database
temp = polhom.l == "S"
# greyscale image of all "S" segments at their temporal midpoint
epggs(dcut(polhom.epg[temp,], 0.5, prop=TRUE))

# greyscale image of all "S" segments from their onset to offset
epggs(polhom.epg[temp,])

# the same but derived from palates
p <- palate(polhom.epg[temp,])
epggs(p)




