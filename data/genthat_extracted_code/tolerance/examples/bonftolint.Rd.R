library(tolerance)


### Name: bonftol.int
### Title: Approximate 2-Sided Tolerance Intervals that Control the Tails
###   Using Bonferroni's Inequality
### Aliases: bonftol.int
### Keywords: file

### ** Examples
 
## 95%/97% tolerance interval for normally distributed
## data controlling 1% of the data is in the lower tail
## and 2% of the data in the upper tail.

set.seed(100)
x <- rnorm(100, 0, 0.2)
bonftol.int(normtol.int, x = x, P1 = 0.01, P2 = 0.02,
            alpha = 0.05, method = "HE")




