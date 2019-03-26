library(ggvoronoi)


### Name: stat_voronoi
### Title: Voronoi Diagrams with ggplot2
### Aliases: stat_voronoi StatVoronoi
### Keywords: choropleth datasets voronoi,

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
    stat_voronoi(aes(x=x,y=y,fill=distance))

ggplot(points) +
    stat_voronoi(aes(x=x,y=y),geom="path")

ggplot(points) +
    stat_voronoi(aes(x=x,y=y,fill=distance),outline=circle)



