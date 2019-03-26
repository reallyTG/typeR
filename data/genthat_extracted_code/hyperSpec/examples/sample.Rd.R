library(hyperSpec)


### Name: sample,hyperSpec-method
### Title: Random Samples and Permutations Take a sample of the specified
###   size from the elements of x with or without replacement.
### Aliases: sample,hyperSpec-method isample sample,data.frame-method
###   sample,matrix-method
### Keywords: distribution methods

### ** Examples


sample (flu, 3)

plot (flu, col = "darkgray")
plot (sample (flu, 3), col = "red", add = TRUE)

plot (flu, col = "darkgray")
plot (sample (flu, 3, replace = TRUE), col = "#0000FF80", add = TRUE,
      lines.args = list (lwd = 2));

isample (flu, 3)
isample (flu, 3, replace = TRUE)
isample (flu, 8, replace = TRUE)
sample (cars, 2)
sample (matrix (1:24, 6), 2)



