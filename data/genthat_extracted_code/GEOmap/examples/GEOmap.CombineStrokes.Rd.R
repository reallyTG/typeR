library(GEOmap)


### Name: GEOmap.CombineStrokes
### Title: Combine strokes in a GEOmap list
### Aliases: GEOmap.CombineStrokes
### Keywords: misc

### ** Examples


data(coastmap)
SEL = which(coastmap$STROKES$nam=="Caribbean")


CAR =  GEOmap.Extract(coastmap, SEL, INOUT="in" )

plotGEOmap(CAR, MAPstyle=3, NUMB=TRUE)

CAR2 = GEOmap.CombineStrokes(CAR, SEL =c(6:15)  )

plotGEOmap(CAR2, MAPstyle=3, MAPcol='red' , add=TRUE)




