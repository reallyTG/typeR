library(pracma)


### Name: mldivide
### Title: Matlab backslash operator
### Aliases: mldivide mrdivide
### Keywords: math

### ** Examples

# Solve a system of linear equations
A <- matrix(c(8,1,6, 3,5,7, 4,9,2), nrow = 3, ncol = 3, byrow = TRUE)
b <- c(1, 1, 1)
mldivide(A, b)  # 0.06666667 0.06666667 0.06666667

A <- rbind(1:3, 4:6)
mldivide(A, c(1,1))                 # -0.5  0  0.5 ,i.e. Matlab/Octave result
mldivide(A, c(1,1), pinv = FALSE)   # -1    1  0         R    qr.solve result



