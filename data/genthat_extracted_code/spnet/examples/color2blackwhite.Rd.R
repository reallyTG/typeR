library(spnet)


### Name: color2blackwhite
### Title: Convert colors to contrasted gray level for black and white
###   rendering
### Aliases: color2blackwhite

### ** Examples

mycols = c("#BA364E", "#32BAA1", "#12AA91")
color2blackwhite(mycols)

barplot(1:3, axes=FALSE, col=mycols)
barplot(1:3, axes=FALSE, col=color2blackwhite(mycols, increase.contrast = FALSE))
barplot(1:3, axes=FALSE, col=color2blackwhite(mycols))
barplot(1:3, axes=FALSE, col=color2blackwhite(mycols, contrast.min = 0, contrast.max = 1))



