library(TeachingDemos)


### Name: rgl.Map
### Title: Plot a map in an rgl window
### Aliases: rgl.Map
### Keywords: hplot dynamic

### ** Examples

if(interactive()){
# assumes that the time zone shape files have been downloaded
# from: http://openmap.bbn.com/data/shape/timezone/

tz <- maptools:::read.shape('WRLDTZA')
rgl.Map(tz)
rgl.spheres(0,0,0,.999, col='darkblue')
}



