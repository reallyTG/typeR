library(tolerance)


### Name: neghypertol.int
### Title: Negative Hypergeometric Tolerance Intervals
### Aliases: neghypertol.int
### Keywords: file

### ** Examples

## 90%/95% 2-sided negative hypergeometric tolerance
## intervals for a future number of 20 successes when
## the universe is of size 100.  The estimates are 
## based on having drawn 50 in another sample to achieve 
## 20 successes.

neghypertol.int(50, 20, 100, m = 20, alpha = 0.05, 
                P = 0.95, side = 2, method = "LS")



