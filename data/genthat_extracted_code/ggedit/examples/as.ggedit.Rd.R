library(ggedit)


### Name: as.ggedit
### Title: Try to coerce a ggplot object into a ggedit object
### Aliases: as.ggedit

### ** Examples


p  <- ggplot2::ggplot(iris,ggplot2::aes(x =Sepal.Length,y=Sepal.Width))

p1 <- p + 
ggplot2::geom_point(ggplot2::aes(colour=Species)) + 
ggplot2::geom_line()

p2 <- p + 
ggplot2::geom_point() + 
ggplot2::geom_smooth(method='loess')

p3 <- list(p1,p2)

p4 <- as.ggedit(p3)

p4



