library(colocalization)


### Name: nsinc.d
### Title: Colocalization index of d-type
### Aliases: nsinc.d

### ** Examples

## A simulated 2D example data.
set.seed(1234)
x <- runif(300, min = -1, max = 1)
y <- runif(300, min = -1, max = 1)
red <- data.frame(x,y, color = "red")
x <- runif(50, min = -1, max = 1)
y <- runif(50, min = -1, max = 1)
green <- data.frame(x,y, color = "green")

mydata <- rbind(red,green)
plot(mydata$x,mydata$y,col = mydata$color)

## No test: 
mydata.results <- nsinc.d(data = mydata, membership = "color", dim = 2)

mydata.results$index.all
mydata.results$index
## End(No test)

## A simulated 3D example data.
data("twolines")

## No test: 
library("rgl")
plot3d(twolines[,c("x","y","z")], type='s', size=0.7, col = twolines$membership)
aspect3d("iso")
## End(No test)

twolines.results <- nsinc.d(data = twolines, membership = "membership",
                            dim = 3, r.model = "r.med")

twolines.results$index



