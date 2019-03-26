library(nonparaeff)


### Name: ddf
### Title: Linear Programming for the Directional Distance Function
### Aliases: ddf
### Keywords: Data Envelopment Analysis

### ** Examples

## Simple Example of one input and one output.
my.dat <- data.frame(y = c(1, 2, 4, 6, 7, 9, 9),
                     x = c(3, 2, 6, 4, 8, 8, 10))
(re <- ddf(my.dat, noutput = 1, direction = c(1, 1)))



