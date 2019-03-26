library(RSSL)


### Name: generateParallelPlanes
### Title: Generate Parallel planes
### Aliases: generateParallelPlanes

### ** Examples

library(ggplot2)
df <- generateParallelPlanes(100,3)
ggplot(df, aes(x=x,y=y,color=Class,shape=Class)) +
 geom_point()




