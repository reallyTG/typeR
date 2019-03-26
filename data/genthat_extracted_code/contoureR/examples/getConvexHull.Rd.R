library(contoureR)


### Name: getConvexHull
### Title: Get Convex Hull of Points
### Aliases: getConvexHull

### ** Examples

#Generate the Convex Hull of a Series of Points
set.seed(1)
x  = runif(100)
y  = runif(100)
ch = getConvexHull(x,y)

#To demonstrate, Lets view the hull
library(ggplot2)
df = data.frame(x,y)
ggplot(data=df,aes(x,y)) +
   geom_path(data=df[ch,]) +
   geom_point()



