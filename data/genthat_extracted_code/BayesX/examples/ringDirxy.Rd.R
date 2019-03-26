library(BayesX)


### Name: .ringDirxy
### Title: Compute direction of points in a polygon.
### Aliases: .ringDirxy
### Keywords: internal

### ** Examples

## create test polygon ordered clockwise
nPoints <- 200
sequence <- seq(from=1, to=10, length=nPoints)
firstHalf <- sequence[1:(nPoints/2)]

test <- cbind(x=c(sequence, rev(sequence)),
              y=c(firstHalf, rev(firstHalf), -firstHalf, -rev(firstHalf)))
plot(test,
     type="n")
polygon(test)

## compute direction with this and the original function
stopifnot(identical(BayesX:::.ringDirxy(test), as.integer(+1)))
## Not run: maptools:::.ringDirxy(test)

## now transform to counter-clockwise and try that
test[, 2] <- - test[, 2]
stopifnot(identical(BayesX:::.ringDirxy(test), as.integer(-1)))
## Not run: maptools:::.ringDirxy(test)



