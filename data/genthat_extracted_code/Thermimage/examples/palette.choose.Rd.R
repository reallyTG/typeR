library(Thermimage)


### Name: palette.choose
### Title: Choose a colour palette for gradient filling thermal image
###   files.
### Aliases: palette.choose

### ** Examples


###### Example #####
palnames<-c("flir", "ironbow", "mikronprism", "glowbow", "grey120", "grey10", "greyred", 
"hotiron",  "medical", "midgreen", "midgrey", "mikroscan", "yellowpal", "rainbowpal")
palnames<-as.matrix(palnames)

pals<-apply(as.matrix(palnames),1,palette.choose)
# add palnames to a list to call in image function below

par(mfrow=c(4,1),mar=c(1,0.3,1,0.3))
r<-c(1:500)
m<-matrix(r,500)

## Show palettes
image(m, axes=FALSE, col=flirpal, main="Flir Standard Palette")
image(m, axes=FALSE, col=ironbowpal, main="Ironbow Palette") 
# smaller palette for faster plotting
image(m, axes=FALSE, col=mikronprismpal, main="Mikron Prism Palette")
image(m, axes=FALSE, col=glowbowpal, main="Glowbow Palette")
image(m, axes=FALSE, col=grey120pal, main="Grey120 Palette")
image(m, axes=FALSE, col=grey10pal, main="Grey10 Palette")
image(m, axes=FALSE, col=greyredpal, main="Greyred Palette")
image(m, axes=FALSE, col=hotironpal, main="Hotiron Palette")
image(m, axes=FALSE, col=medicalpal, main="Medical Palette")
image(m, axes=FALSE, col=midgreypal, main="Midgrey Palette")
image(m, axes=FALSE, col=mikroscanpal, main="Mikroscan Palette")
image(m, axes=FALSE, col=rainbowpal, main="Rainbow Palette")
image(m, axes=FALSE, col=yellowpal, main="Yellow Palette")

# Palettes can be run in reverse
par(mfrow=c(2,1),mar=c(1,0.3,1,0.3))
image(m, axes=FALSE, col=flirpal, main="Flir Standard Palette")
image(m, axes=FALSE, col=rev(flirpal), main="Reverse Flir Standard Palette")




