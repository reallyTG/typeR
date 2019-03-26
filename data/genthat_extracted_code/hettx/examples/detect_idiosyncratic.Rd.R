library(hettx)


### Name: detect_idiosyncratic
### Title: detect_idiosyncratic
### Aliases: detect_idiosyncratic

### ** Examples

Z <- rep(c(0, 1), 100)
tau <- 4
Y <- ifelse(Z, rnorm(100, tau), rnorm(100, 0))
df <- data.frame(Y=Y, Z=Z)
tst <- detect_idiosyncratic(Y ~ Z, df, B = 50, grid.size = 50)



