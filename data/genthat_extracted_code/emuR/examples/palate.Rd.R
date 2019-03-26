library(emuR)


### Name: palate
### Title: Obtain a three-dimensional palatographic array
### Aliases: palate
### Keywords: datagen

### ** Examples


# convert an EPG-compressed trackdata object to palatograms
p <- palate(coutts.epg)

# convert an EPG-compressed matrix to palatograms
p <- palate(dcut(coutts.epg, 0, prop=TRUE))





