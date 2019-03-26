library(fungible)


### Name: normF
### Title: Compute the Frobenius norm of a matrix
### Aliases: normF
### Keywords: statistics

### ** Examples

data(BadRLG)
out <- smoothLG(R = BadRLG, Penalty = 50000)
cat("\nGradient at solution:", out$gr,"\n")
cat("\nNearest Correlation Matrix\n")
print( round(out$RLG,8) )
cat("\nFrobenius norm of (NPD - PSD) matrix\n")
print(normF(BadRLG - out$RLG ))



