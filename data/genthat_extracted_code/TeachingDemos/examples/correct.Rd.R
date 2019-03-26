library(TeachingDemos)


### Name: cor.rect.plot
### Title: Plot a visualization of the correlation using colored rectangles
### Aliases: cor.rect.plot
### Keywords: hplot

### ** Examples

## low correlation
x <- rnorm(25)
y <- rnorm(25)
cor(x,y)
cor.rect.plot(x,y)

## Positive correlation
x <- rnorm(25)
y <- x + rnorm(25,3, .5)
cor(x,y)
cor.rect.plot(x,y)

## negative correlation
x <- rnorm(25)
y <- rnorm(25,10,1.5) - x
cor(x,y)
cor.rect.plot(x,y)

## zero correlation but a definite relationship
x <- -5:5
y <- x^2
cor(x,y)
cor.rect.plot(x,y)



