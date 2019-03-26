library(RegSDC)


### Name: ReduceX
### Title: Suppressed tabular data: Reduce dummy matrix, X (and estimate Y)
### Aliases: ReduceX
### Keywords: internal

### ** Examples

# Same data as in the paper
z <- RegSDCdata("sec7z")
x <- RegSDCdata("sec7x")
y <- RegSDCdata("sec7y")  # Now z is t(x) %*% y 

a <- ReduceX(x, z, y)
b <- ReduceX(x, z)
d <- ReduceX(x, z = NULL, y)  # No z in output

# Identical output for x and z
identical(a$x, b$x)
identical(a$x, d$x)
identical(a$z, b$z)

# Same y in output as input
identical(a$y, y)
identical(d$y, y)

# Estimate of y (yHat) when NULL y input
b$y

# These elements of y can be found directly in in z
y[a$yKnown, , drop = FALSE]
# They can be found by searching for unit colSums
colSums(x)[colSums(x) == 1]

# These trivial data rows can be omitted when processing data
x[!a$yKnown, ]
# Now several columns can be omitted since zero colSums
colSums0 <- colSums(x[!a$yKnown, ]) == 0
# The resulting matrix is output from the function
identical(x[!a$yKnown, !colSums0], a$x)

# Output z can be computed from this output x
identical(t(a$x) %*% y[!a$yKnown, , drop = FALSE], a$z)



