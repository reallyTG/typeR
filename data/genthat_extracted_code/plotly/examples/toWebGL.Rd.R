library(plotly)


### Name: toWebGL
### Title: Convert trace types to WebGL
### Aliases: toWebGL

### ** Examples


# currently no bargl trace type
toWebGL(ggplot() + geom_bar(aes(1:10)))
toWebGL(qplot(1:10, 1:10))




