library(TeachingDemos)


### Name: put.points.demo
### Title: Demonstrate Correlation and Regression by placing and moving
###   data points
### Aliases: put.points.demo
### Keywords: dynamic iplot regression

### ** Examples


if(interactive()){
put.points.demo()

x <- rnorm(25, 5, 1)
y <- x + rnorm(25)
put.points.demo(x,y)
}




