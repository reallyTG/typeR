library(ggedit)


### Name: remove_geom
### Title: Remove a layer from a compiled ggplot2 object.
### Aliases: remove_geom

### ** Examples

p <- ggplot2::ggplot(iris,ggplot2::aes(x =Sepal.Length,y=Sepal.Width))
p <- p+ggplot2::geom_point(ggplot2::aes(colour=Species))+ggplot2::geom_line()
p
pnew <- p%>%remove_geom('point',1)
pnew



