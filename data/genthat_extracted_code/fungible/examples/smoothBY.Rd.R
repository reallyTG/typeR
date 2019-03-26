library(fungible)


### Name: smoothBY
### Title: Smooth an NPD R matrix to PD using the Bentler Yuan 2011 method
### Aliases: smoothBY
### Keywords: statistics

### ** Examples

data(BadRBY)

out<-smoothBY(R = BadRBY, const = .98)
cat("\nSmoothed Correlation Matrix\n")
print( round(out$RBY,8) )
cat("\nEigenvalues of smoothed matrix\n")
print( eigen(out$RBY)$val  )



