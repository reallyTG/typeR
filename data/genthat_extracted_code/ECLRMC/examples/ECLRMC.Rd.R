library(ECLRMC)


### Name: ECLRMC
### Title: Takes an incomplete matrix and returns the imputed matrix using
###   ECLRMC method.
### Aliases: ECLRMC

### ** Examples

x = matrix(c(5.1, 4.9, NA, 4.6, 3.5, 3.0, 3.2, 3.1, 1.4, NA, 1.3, 1.5), byrow = TRUE, ncol=4)
ECLRMC(x, beta = 0.2)



