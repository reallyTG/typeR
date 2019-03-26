library(GEOmap)


### Name: GlobeView
### Title: Global Plot
### Aliases: GlobeView
### Keywords: misc

### ** Examples



data(coastmap)

phicen  =32.20122+5
lamcen  = 335.7092+20
MAXR    = 100

carolinablue = rgb(83/255, 157/255, 194/255)


SEL=which( coastmap$STROKES$code=="C")
SEL = c(SEL, which(coastmap$STROKES$nam=="GreatBritain"),
which(coastmap$STROKES$nam=="Japan"), which(coastmap$STROKES$nam=="Ireland"))


PER = GlobeView(phicen, lamcen, SEL=SEL, coastmap, MAXR,
linecol=rgb(.2, .2, .2), mapcol=rgb(.8, .8, .8), 
innercol=carolinablue , circol=carolinablue ,    backcol="white")




