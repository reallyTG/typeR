library(matlib)


### Name: rowadd
### Title: Add multiples of rows to other rows
### Aliases: rowadd

### ** Examples

A <- matrix(c(2, 1, -1,
             -3, -1, 2,
             -2,  1, 2), 3, 3, byrow=TRUE)
b <- c(8, -11, -3)

# using row operations to reduce below diagonal to 0
Ab <- cbind(A, b)
(Ab <- rowadd(Ab, 1, 2, 3/2))  # row 2 <- row 2 + 3/2 row 1
(Ab <- rowadd(Ab, 1, 3, 1))    # row 3 <- row 3 + 1 row 1
(Ab <- rowadd(Ab, 2, 3, -4))   # row 3 <- row 3 - 4 row 2
# multiply to make diagonals = 1
(Ab <- rowmult(Ab, 1:3, c(1/2, 2, -1)))
# The matrix is now in triangular form

# Could continue to reduce above diagonal to zero
echelon(A, b, verbose=TRUE, fractions=TRUE)




