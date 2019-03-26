library(ggedit)


### Name: cloneLayer
### Title: Creates an independent copy of a ggplot layer object
### Aliases: cloneLayer

### ** Examples

p <- ggplot2::ggplot(iris,ggplot2::aes(x =Sepal.Length,y=Sepal.Width))

p <- p + 
ggplot2::geom_point(ggplot2::aes(colour='Species')) + 
ggplot2::geom_line()

p$layers[[1]]

newLayer <- cloneLayer(l=p$layers[[1]])

all.equal(p$layers[[1]],newLayer)

(v <- cloneLayer(l=p$layers[[1]],verbose=TRUE))

eval(parse(text=v))

all.equal(p$layers[[1]],eval(parse(text=v)))




