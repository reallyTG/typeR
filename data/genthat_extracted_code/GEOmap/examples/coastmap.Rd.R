library(GEOmap)


### Name: coastmap
### Title: Global Coast Map
### Aliases: coastmap
### Keywords: datasets

### ** Examples

data(coastmap)
#######  see the codes:
unique(coastmap$STROKES$code)
#########  see the different names:
unique(coastmap$STROKES$nam)

#########  change the colors based on code
coastmap$STROKES$col[coastmap$STROKES$code=="C" ] = rgb(1, .6, .6)
coastmap$STROKES$col[coastmap$STROKES$code=="c" ] = rgb(1, .9, .9)
coastmap$STROKES$col[coastmap$STROKES$code=="L" ] = rgb(.6, .6, 1)

plotGEOmap(coastmap , border='black' , add=FALSE, xaxs='i')





##



