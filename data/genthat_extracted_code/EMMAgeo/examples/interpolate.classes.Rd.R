library(EMMAgeo)


### Name: interpolate.classes
### Title: Function to interpolate classes.
### Aliases: interpolate.classes
### Keywords: EMMA

### ** Examples

## load example data
data(X, envir = environment())
classes.in <- seq(from = 1, to = 10, length.out = ncol(X))

## Example 1 - decrease the class numbers
## define number of output classes
classes.out <- seq(1, 10, length.out = 20)

## interpolate the data set
Y <- interpolate.classes(X = X,
                         boundaries.in = classes.in,
                         boundaries.out = classes.out,
                         method = "linear")

## show original vs. interpolation for first 10 samples
plot(NA, xlim = c(1, 10), ylim = c(0, 11))
for(i in 1:10) {
  lines(classes.in, X[i,] * 20 + i)
  lines(classes.out, Y[i,] * 20 + i, col = 2)
}

## Example 2 - increase the class numbers
## define number of output classes
classes.out <- seq(1, 10, length.out = 200)

## interpolate the data set
Y <- interpolate.classes(X = X,
                         boundaries.in = classes.in,
                         boundaries.out = classes.out)

## show original vs. interpolation for first 10 samples
plot(NA, xlim = c(1, 10), ylim = c(0, 11))
for(i in 1:10) {
  lines(classes.in, X[i,] * 20 + i)
  lines(classes.out, Y[i,] * 20 + i, col = 2)
}



