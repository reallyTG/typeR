library(gglogo)


### Name: letterToPolygon
### Title: Convert an image file to a polygon
### Aliases: letterToPolygon

### ** Examples

library(ggplot2)
letter <- letterToPolygon("R", fontfamily="Helvetica")
qplot(x, y, geom="polygon", data = letter, fill=I("black"), alpha=I(0.8))+
     coord_equal()



