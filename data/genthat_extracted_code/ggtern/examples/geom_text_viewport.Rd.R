library(ggtern)


### Name: geom_text_viewport
### Title: Draw Text at Relative Position on Viewport
### Aliases: geom_text_viewport GeomTextViewport
### Keywords: datasets

### ** Examples

library(ggplot2)
data(Feldspar)
base = ggtern(data=Feldspar,aes(Ab,An,Or)) + 
  geom_mask() + 
  geom_point() + 
  geom_text_viewport(x=0.5,y=0.5,label="Middle",color='red') + 
  geom_text_viewport(x=1.0,y=1.0,label="Top Right",color='blue') + 
  geom_text_viewport(x=0.0,y=0.0,label="Bottom Left",color='green') +
  geom_text_viewport(x=0.0,y=1.0,label="Top Left",color='orange') + 
  geom_text_viewport(x=1.0,y=0.0,label="Bottom Right",color='magenta')
base

base + 
  geom_text_viewport(x=0.9,y=0.5,label="Clipping Turned Off",color='purple',hjust=0,clip='on') 

base + 
  geom_text_viewport(x=0.9,y=0.5,label="Clipping Turned Off",color='purple',hjust=0,clip='off') 




