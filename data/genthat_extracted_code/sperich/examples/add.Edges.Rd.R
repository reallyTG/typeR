library(sperich)


### Name: add.Edges
### Title: Edge Creation
### Aliases: add.Edges

### ** Examples

##initialize data
m <- matrix(0,10,10)
point.a <- c(5,8)
point.b <- c(10,3)

##calculate the distance of the two points
m <- add.Edges(m,point.a,point.b)
image(m)



