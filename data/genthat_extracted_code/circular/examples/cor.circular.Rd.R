library(circular)


### Name: cor.circular
### Title: Correlation Coefficient for Angular Variables
### Aliases: cor.circular
### Keywords: univar

### ** Examples

# Generate two circular data sets, and compute their correlation.
x <- rvonmises(n=50, mu=circular(0), kappa=3)
y <- x + rvonmises(n=50, mu=circular(pi), kappa=10)
cor.circular(x, y, test=TRUE)



