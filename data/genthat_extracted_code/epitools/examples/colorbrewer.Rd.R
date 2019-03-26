library(epitools)


### Name: colorbrewer
### Title: Display and create ColorBrewer palettes
### Aliases: colorbrewer.display colorbrewer.palette colorbrewer.data
### Keywords: color

### ** Examples

##display available palettes for given nclass and type
colorbrewer.display(9, "sequential")

##change background to blue
colorbrewer.display(9, "sequential", "blue")

##display available palettes for given nclass and type,
##but also display RGB numbers to create your own palette
cbrewer.9s <- colorbrewer.display(9, "sequential")
cbrewer.9s


##Display and use ColorBrewer palette
##first, display and choose palette (letter)
colorbrewer.palette(10, "q")

##second, extract and use ColorBrewer palette
mycolors <- colorbrewer.palette(nclass = 10, type = "q", palette = "b")
xx <- 1:10
yy <- outer(1:10, 1:10, "*")
matplot(xx,yy, type="l", col = mycolors, lty = 1, lwd = 4)




