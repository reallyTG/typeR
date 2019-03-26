library(tolerance)


### Name: hypertol.int
### Title: Hypergeometric Tolerance Intervals
### Aliases: hypertol.int
### Keywords: file

### ** Examples
 
## 90%/95% 1-sided and 2-sided hypergeometric tolerance 
## intervals for a future sample of 30 when the universe
## is of size 100.

hypertol.int(x = 15, n = 50, N = 100, m = 30, alpha = 0.10, 
             P = 0.95, side = 1, method = "LS")
hypertol.int(x = 15, n = 50, N = 100, m = 30, alpha = 0.10, 
             P = 0.95, side = 1, method = "CC")
hypertol.int(x = 15, n = 50, N = 100, m = 30, alpha = 0.10, 
             P = 0.95, side = 2, method = "LS")
hypertol.int(x = 15, n = 50, N = 100, m = 30, alpha = 0.10, 
             P = 0.95, side = 2, method = "CC")
 


