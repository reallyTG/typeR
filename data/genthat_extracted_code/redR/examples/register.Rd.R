library(redR)


### Name: register
### Title: Registration parameter estimation
### Aliases: register

### ** Examples


src <- cameraman

tar <- shift(cameraman, c(5,-15))
round(s <- register(src, tar, method = 'coarse', steps = 4), 4)

tar <- shift(cameraman, c(-1.155, 3.231))
round(s <- register(src, tar, method = 'taylor', tol = 1e-4), 4)

tar <- transform(cameraman, c(c(-1.155, 1.231, 0.121)))
round(s <- register(src, tar, method = 'taylor3', tol = 1e-4, maxiter = 100), 4)



