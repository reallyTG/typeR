library(metR)


### Name: geom_label_contour
### Title: Label contours
### Aliases: geom_label_contour GeomLabelContour geom_text_contour
###   GeomTextContour StatTextContour
### Keywords: datasets

### ** Examples

library(ggplot2)
v <- data.table::melt(volcano)
g <- ggplot(v, aes(Var1, Var2)) +
       geom_contour(aes(z = value))
g + geom_text_contour(aes(z = value))

g + geom_text_contour(aes(z = value), stroke = 0.2)




