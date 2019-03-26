library(ramify)


### Name: dmat
### Title: Data Frames
### Aliases: dmat

### ** Examples

dmat('1e-01, 2+5, 3, 4, 5; 6, 7, 8, 9^2, pi', rows = FALSE)
z <- list(a = 1:10, b = 11:20, c = 21:30)
dmat(z)  # list elements form rows
dmat(z, rows= FALSE)  # list elements form columns



