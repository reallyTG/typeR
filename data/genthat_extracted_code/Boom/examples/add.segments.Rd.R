library(Boom)


### Name: add.segments
### Title: Function to add horizontal line segments to an existing plot
### Aliases: add.segments AddSegments
### Keywords: aplot

### ** Examples


x <- rnorm(100)
y <- rnorm(100, 1)
boxplot(list(x=x,y=y))
AddSegments(1:2, c(0, 1))  ## add segments to the boxplot




