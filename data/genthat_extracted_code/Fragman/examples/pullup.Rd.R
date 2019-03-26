library(Fragman)


### Name: pullup
### Title: Applying pullup to channels/colors
### Aliases: pullup

### ** Examples

data(my.plants)
layout(matrix(1:2,2,1))
# without pull up adjustment
plot(my.plants[[1]][,1], type="l", col="blue", xlim=c(2750,2850))
lines(my.plants[[1]][,2], col="green")
lines(my.plants[[1]][,3], col="gold")
## adjusted
yy <- pullup(my.plants[[1]])
plot(yy[,1], type="l", col="blue", xlim=c(2750,2850))
lines(yy[,2], col="green")
lines(yy[,3], col="gold")
# general view
yy1 <- pullup(my.plants[[1]], plotting=TRUE)



