library(circular)


### Name: circular
### Title: Create Objects of class circular for Circular data.
### Aliases: circular as.circular is.circular print.circular
### Keywords: misc

### ** Examples

x <- circular(c(pi, pi/3, pi/4))
print(x)
is.circular(x)

x <- circular(runif(10, -pi/2, pi/2), template="geographics")
plot(x)
class(x)

x <- circular(data.frame(runif(10, -pi/2, pi/2)))
plot(x)
class(x)

cbind(x, x) # the matrix, cbind, rbind functions unclass and lost attributes! 
########Use it with care.

x <- c(pi/12,2*pi+pi/12)
print(x)
x <- unique(x)
print(x)

x[1]==x[2]

all.equal(x[1], x[2])

x <- as.circular(pi, control.circular=list(units="radians", zero=pi))
y <- conversion.circular(circular(pi), zero=pi)
res <- plot(x)
points(y, col=2, plot.info=res)




