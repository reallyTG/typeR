library(ifultools)


### Name: autoText
### Title: Automatic text placement
### Aliases: autoText
### Keywords: hplot

### ** Examples

## quadratic 
x <- seq(-5,5)
y <- x^2
plot(x,y,type="p")
autoText(x, y, text="Some text in a parabola", cex=1.5)



