library(sp)


### Name: point.in.polygon
### Title: do point(s) fall in a given polygon?
### Aliases: point.in.polygon
### Keywords: manip

### ** Examples

# open polygon:
point.in.polygon(1:10,1:10,c(3,5,5,3),c(3,3,5,5))
# closed polygon:
point.in.polygon(1:10,rep(4,10),c(3,5,5,3,3),c(3,3,5,5,3))



