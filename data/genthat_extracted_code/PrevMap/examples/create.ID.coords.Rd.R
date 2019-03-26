library(PrevMap)


### Name: create.ID.coords
### Title: ID spatial coordinates
### Aliases: create.ID.coords

### ** Examples

x1 <- runif(5)
x2 <- runif(5)
data <- data.frame(x1=rep(x1,each=3),x2=rep(x2,each=3))
ID.coords <- create.ID.coords(data,coords=~x1+x2)
data[,c("x1","x2")]==unique(data[,c("x1","x2")])[ID.coords,]




