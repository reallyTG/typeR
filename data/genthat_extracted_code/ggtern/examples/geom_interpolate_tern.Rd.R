library(ggtern)


### Name: geom_interpolate_tern
### Title: Ternary Interpolation
### Aliases: geom_interpolate_tern GeomInterpolateTern
###   stat_interpolate_tern StatInterpolateTern
### Keywords: datasets

### ** Examples

data(Feldspar)
ggtern(Feldspar,aes(Ab,An,Or,value=T.C)) + 
stat_interpolate_tern(geom="polygon",
                     formula=value~x+y,
                     method=lm,n=100,
                     breaks=seq(0,1000,by=100),
                     aes(fill=..level..),expand=1) +
                     geom_point()



