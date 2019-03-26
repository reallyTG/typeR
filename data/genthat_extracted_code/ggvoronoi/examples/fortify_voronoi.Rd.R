library(ggvoronoi)


### Name: fortify_voronoi
### Title: Create Data Frame from voronoi_polygons output
### Aliases: fortify_voronoi
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

vor_spdf <- voronoi_polygon(data=points,x="x",y="y",outline=circle)
vor_df <- fortify_voronoi(vor_spdf)

ggplot(vor_df) +
    geom_polygon(aes(x=x,y=y,fill=distance,group=group))



