library(Rfast2)


### Name: Variable selection using the PC-simple algorithm
### Title: Variable selection using the PC-simple algorithm
### Aliases: pc.sel

### ** Examples

y <- rnorm(200)
x <- matrix( rnorm(200 * 50), ncol = 50)
a <- pc.sel(y, x)



