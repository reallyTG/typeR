library(ggedit)


### Name: rgg
### Title: Remove and replace ggplot2 layers.
### Aliases: rgg

### ** Examples

p <- ggplot2::ggplot(iris,ggplot2::aes(x =Sepal.Length,y=Sepal.Width))

p <- p+ggplot2::geom_point(ggplot2::aes(colour=Species))+ggplot2::geom_line()

p

p%>%rgg('point',1)

if( interactive() ){
x <- ggedit(p)
pnew <- p%>%rgg('point',1,x$updatedLayers[[1]])
pnew
}



