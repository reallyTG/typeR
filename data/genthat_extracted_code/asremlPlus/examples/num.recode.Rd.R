library(asremlPlus)


### Name: num.recode
### Title: Recodes the unique values of a vector using the values in a new
###   vector.
### Aliases: num.recode
### Keywords: manip

### ** Examples

## set up a factor with labels
x <- rep(c(-42, -14, 14, 42), 4)
 
## recode x
b <- num.recode(x, c(0, 28, 56, 84))



