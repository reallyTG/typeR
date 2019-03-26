library(binda)


### Name: chances
### Title: Estimate Bernoulli Parameters from Binary Matrix with Class
###   Labels
### Aliases: chances
### Keywords: multivariate

### ** Examples

# load binda library
library("binda")

# example binary matrix with 6 variables (in columns) and 4 samples (in rows)
Xb = matrix(c(1, 1, 0, 1, 0, 0,
             1, 1, 1, 1, 0, 0,
             1, 0, 0, 0, 1, 1,
             1, 0, 0, 0, 1, 1), nrow=4, byrow=TRUE)
colnames(Xb) = paste0("V", 1:ncol(Xb))

# Test for binary matrix
is.binaryMatrix(Xb) # TRUE

L = factor(c("Treatment", "Treatment", "Control", "Control") )

chances(Xb, L)



