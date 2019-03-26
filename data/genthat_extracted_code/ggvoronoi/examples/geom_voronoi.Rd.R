library(ggvoronoi)


### Name: geom_voronoi
### Title: Voronoi Diagrams with ggplot2
### Aliases: geom_voronoi
### Keywords: choropleth voronoi,

### ** Examples

set.seed(45056)
x <- sample(1:200,100)
y <- sample(1:200,100)
points <- data.frame(x, y,
                     distance = sqrt((x-100)^2 + (y-100)^2))
circle <- data.frame(x = 100*(1+cos(seq(0, 2*pi, length.out = 2500))),
                     y = 100*(1+sin(seq(0, 2*pi, length.out = 2500))),
                     group = rep(1,2500))

ggplot(points) +
    geom_voronoi(aes(x=x,y=y,fill=distance))

ggplot(points) +
    geom_voronoi(aes(x=x,y=y,fill=distance),outline=circle)

ggplot(points) +
    geom_voronoi(aes(x=x,y=y,fill=distance),fill=NA,color="black")



