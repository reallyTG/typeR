library(mapplots)


### Name: legend.box
### Title: Define location of a legend box.
### Aliases: legend.box

### ** Examples

plot(1)
box <- legend.box("topleft", maxradius=0.2, inset=0.02)
rect(box[1],box[2],box[3],box[4], border="red", lwd=3, lty=2)
legend.bubble("topleft", z=10, maxradius=0.2, inset=0.02)



