library(crsnls)


### Name: crs4hce
### Title: Estimation of Nonlinear Regression Parameters with CRS4HCe
### Aliases: crs4hce

### ** Examples

x <- c(1,2,3,5,7,10)
y <- c(109,149,149,191,213,224)
df <- data.frame(x=x, y=y)
lowerBounds <- c(1, 0.1)
upperBounds <- c(1000, 2)
mod <- crs4hce(y ~ b1 * (1-exp(-b2*x)), df, lowerBounds, upperBounds)
mod




