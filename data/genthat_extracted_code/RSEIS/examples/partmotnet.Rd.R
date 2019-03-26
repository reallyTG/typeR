library(RSEIS)


### Name: partmotnet
### Title: Particle Motion on Stereonet
### Aliases: partmotnet
### Keywords: hplot

### ** Examples



data("GH")

temp = list(x=GH$JSTR[[1]][1168:1500],
y=GH$JSTR[[2]][1168:1500], z=GH$JSTR[[3]][1168:1500])

sx = partmotnet(temp, STAMP="Example",
LINES=TRUE, COL=rainbow(100) )






