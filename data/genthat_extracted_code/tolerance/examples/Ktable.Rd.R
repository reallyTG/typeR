library(tolerance)


### Name: K.table
### Title: Tables of K-factors for Tolerance Intervals Based on Normality
### Aliases: K.table
### Keywords: file

### ** Examples
 
## Tables generated for each value of the sample size.

K.table(n = seq(50, 100, 10), alpha = c(0.01, 0.05, 0.10), 
        P = c(0.90, 0.95, 0.99), by.arg = "n")

## Tables generated for each value of the confidence level.

K.table(n = seq(50, 100, 10), alpha = c(0.01, 0.05, 0.10), 
        P = c(0.90, 0.95, 0.99), by.arg = "alpha")

## Tables generated for each value of the coverage proportion.

K.table(n = seq(50, 100, 10), alpha = c(0.01, 0.05, 0.10), 
        P = c(0.90, 0.95, 0.99), by.arg = "P")
        



