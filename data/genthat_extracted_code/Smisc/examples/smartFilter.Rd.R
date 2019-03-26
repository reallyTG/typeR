library(Smisc)


### Name: smartFilter
### Title: Calculate a moving dot product (or filter) over a numeric vector
### Aliases: smartFilter
### Keywords: misc

### ** Examples


 # Define a simple vector
 x <- 2^(0:8)
 names(x) <- letters[1:9]

 # Define weights for a simple moving average of 3 points
 # (1 point in the past, the present point, and 1 point in the future)
 wts <- rep(1, 3) / 3

 # Note how they are the same, except at the edges of the series.
 smartFilter(x, wts)
 filter(x, wts)

 # filter() and smartFilter() apply the weights in reverse order of each other,
 # which makes a difference if the weights are not symmetric. Note how these
 # two statements produce the same result (with the exception of the first and
 # last elements)
 filter(x, 1:3 / 6)
 smartFilter(x, 3:1 / 6)

 # Notice how filter() propogates missing values
 y <- 3^(0:8)
 y[5] <- NA
 smartFilter(y, wts)
 filter(y, wts)

 # Compare starting on the second value and skip every other point
 smartFilter(x, wts)
 smartFilter(x, wts, start = 2, skip = 2)

 # Demonstrate how the 'min.window' and 'balance' work
 y <- round(rnorm(1:20),2)
 names(y) <- letters[1:20]
 y[7:9] <- NA
 y
 smartFilter(y, rep(1,5)/5, min.window = 2, balance = TRUE)
 smartFilter(y, rep(1,5)/5, min.window = 2, balance = FALSE)




