library(colocalization)


### Name: nsinc.z
### Title: Colocalization index of z-type
### Aliases: nsinc.z

### ** Examples

## a simulated 2D example data.
set.seed(1234)
x <- runif(300, min = -1, max = 1)
y <- runif(300, min = -1, max = 1)
red <- data.frame(x,y, color = "red")
x <- runif(50, min = -1, max = 1)
y <- runif(50, min = -1, max = 1)
green <- data.frame(x,y, color = "green")

mydata <- rbind(red,green)
plot(mydata$x,mydata$y,col = mydata$color)

mydata.results <- nsinc.z(data = mydata, membership = "color", dim = 2,
                  r.model = "other", r.min = 0.01, r.max = 0.5, r.count = 5, r.adjust = 0)

mydata.results$index.all
mydata.results$index


## a simulated 3D example data.
data("twolines")

## No test: 
library("rgl")
plot3d(twolines[,c("x","y","z")], type='s', size=0.7, col = twolines$membership)
aspect3d("iso")

twolines.results <- nsinc.z(data = twolines, membership = "membership",
                            dim = 3, r.model = "full")

twolines.results$index
## End(No test)



