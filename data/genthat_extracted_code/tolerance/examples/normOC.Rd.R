library(tolerance)


### Name: norm.OC
### Title: Operating Characteristic (OC) Curves for K-Factors for Tolerance
###   Intervals Based on Normality
### Aliases: norm.OC
### Keywords: file

### ** Examples
 
## The three types of OC-curves that can be constructed
## with the norm.OC function.
 
norm.OC(k = 4, alpha = NULL, P = c(0.90, 0.95, 0.99), 
        n = 10:20, side = 1)

norm.OC(k = 4, alpha = c(0.01, 0.05, 0.10), P = NULL, 
        n = 10:20, side = 1)

norm.OC(k = NULL, P = c(0.90, 0.95, 0.99), 
        alpha=c(0.01,0.05,0.10), n = 10:20, side = 1) 



