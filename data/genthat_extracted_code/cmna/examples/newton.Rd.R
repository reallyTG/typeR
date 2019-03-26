library(cmna)


### Name: newton
### Title: Newton's method
### Aliases: newton

### ** Examples

f <- function(x) { x^3 - 2 * x^2 - 159 * x - 540 }
fp <- function(x) {3 * x^2 - 4 * x - 159 }
newton(f, fp, 1)




