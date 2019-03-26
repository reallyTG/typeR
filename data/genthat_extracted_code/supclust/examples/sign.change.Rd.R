library(supclust)


### Name: sign.change
### Title: Sign-flipping of Predictor Variables to Obtain Equal Polarity
### Aliases: sign.change
### Keywords: manip

### ** Examples

data(leukemia, package="supclust")

op <- par(mfrow=c(1,3))
plot(leukemia.x[,69],leukemia.y)
title(paste("Margin = ", round(margin(leukemia.x[,69], leukemia.y),2)))

## Sign-flipping is very important
plot(leukemia.x[,161],leukemia.y)
title(paste("Margin = ", round(margin(leukemia.x[,161], leukemia.y),2)))
x <- sign.change(leukemia.x, leukemia.y)$x.new
plot(x[,161],leukemia.y)
title(paste("Margin = ", round(margin(x[,161], leukemia.y),2)))
par(op)



