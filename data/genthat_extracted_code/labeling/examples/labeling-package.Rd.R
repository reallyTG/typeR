library(labeling)


### Name: labeling-package
### Title: Axis labeling
### Aliases: labeling labeling-package
### Keywords: dplot

### ** Examples

heckbert(8.1, 14.1, 4)	# 5 10 15
wilkinson(8.1, 14.1, 4)	# 8 9 10 11 12 13 14 15
extended(8.1, 14.1, 4)	# 8 10 12 14
# When plotting, extend the plot range to include the labeling
# Should probably have a helper function to make this easier
data(iris)
x <- iris$Sepal.Width
y <- iris$Sepal.Length
xl <- extended(min(x), max(x), 6)
yl <- extended(min(y), max(y), 6)
plot(x, y,
    xlim=c(min(x,xl),max(x,xl)),
    ylim=c(min(y,yl),max(y,yl)),
    axes=FALSE, main="Extended labeling")
axis(1, at=xl)
axis(2, at=yl)



