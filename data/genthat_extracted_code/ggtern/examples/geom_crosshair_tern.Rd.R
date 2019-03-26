library(ggtern)


### Name: geom_crosshair_tern
### Title: Ternary Crosshairs
### Aliases: geom_crosshair_tern GeomCrosshairTern geom_Tmark GeomTmark
###   geom_Lmark GeomLmark geom_Rmark GeomRmark
### Keywords: datasets

### ** Examples

set.seed(1)
df = data.frame(x=runif(10),y=runif(10),z=runif(10))
base = ggtern(df,aes(x,y,z)) + geom_point()
base + geom_crosshair_tern()
base + geom_Tmark()
base + geom_Rmark()
base + geom_Lmark()



