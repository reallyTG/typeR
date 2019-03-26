library(ggedit)


### Name: layersList
### Title: layersList
### Aliases: layersList

### ** Examples

p=ggplot2::ggplot(iris,ggplot2::aes(x=Sepal.Length,y=Sepal.Width))
p=p+ggplot2::geom_point(ggplot2::aes(colour=Species))+ggplot2::geom_line()
p
p.list=layersList(p)
p.list




