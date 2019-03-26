library(Smisc)


### Name: dframeEquiv
### Title: Examines the equivalence of two dataframes or matrices
### Aliases: dframeEquiv
### Keywords: misc

### ** Examples


# Number of rows different
dframeEquiv(matrix(rnorm(20), nrow = 4),
            matrix(rnorm(25), nrow = 5))

# Number of columns different
dframeEquiv(matrix(rnorm(16), nrow = 4),
            matrix(rnorm(20), nrow = 4))

# Rownames differ
dframeEquiv(matrix(rnorm(9), nrow = 3, dimnames = list(1:3, NULL)),
            matrix(rnorm(9), nrow = 3, dimnames = list(letters[1:3], NULL)))

# Colnames differ
dframeEquiv(matrix(rnorm(9), nrow = 3, dimnames = list(NULL, 1:3)),
            matrix(rnorm(9), nrow = 3, dimnames = list(NULL, letters[1:3])))

# Not equivalent
x <- data.frame(x = factor(c(1,1,2,2,3,3)), y = rnorm(6))
y <- data.frame(x = factor(c(1,2,2,2,3,3)), y = c(x$y[-6],rnorm(1)))
dframeEquiv(x, y)

# Look at discrepancies
out <- dframeEquiv(x, y)
out

# Equivalent
x <- data.frame(x = letters[1:6], y = 0:5)
y <- x
dframeEquiv(x, y)




