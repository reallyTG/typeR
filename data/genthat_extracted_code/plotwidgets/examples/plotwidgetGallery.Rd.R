library(plotwidgets)


### Name: plotwidgetGallery
### Title: A showcase of all plot types available in plotwidgets
### Aliases: plotwidgetGallery

### ** Examples

plotwidgetGallery()
## automatically set black bg
plotwidgetGallery(theme="neon") 
## yuck, ugly:
plotwidgetGallery(pal=c("red", "#FF9900", "blue", "green", "cyan", "yellow"))
## much better:
plotwidgetGallery(pal=plotPals("pastel", alpha=0.8))



