library(ggtern)


### Name: geom_label_viewport
### Title: Draw Label at Relative Position on Viewport
### Aliases: geom_label_viewport GeomLabelViewport
### Keywords: datasets

### ** Examples

library(ggplot2)
data(Feldspar)
base = ggtern(data=Feldspar,aes(Ab,An,Or)) + 
  geom_mask() + 
  geom_point() + 
  geom_label_viewport(x=0.5,y=0.5,label="Middle",color='red') + 
  geom_label_viewport(x=1.0,y=1.0,label="Top Right",color='blue') + 
  geom_label_viewport(x=0.0,y=0.0,label="Bottom Left",color='green') +
  geom_label_viewport(x=0.0,y=1.0,label="Top Left",color='orange') + 
  geom_label_viewport(x=1.0,y=0.0,label="Bottom Right",color='magenta')
base

base + 
  geom_label_viewport(x=0.9,y=0.5,label="Clipping Turned Off",color='purple',hjust=0,clip='on') 

base + 
  geom_label_viewport(x=0.9,y=0.5,label="Clipping Turned Off",color='purple',hjust=0,clip='off') 




