library(fungible)


### Name: smoothKB
### Title: Smooth a Non PD Correlation Matrix
### Aliases: smoothKB
### Keywords: Statistics

### ** Examples

data(BadRLG)

## RKB = smoothed R
RKB<-smoothKB(R=BadRLG, eps = 1E8 * .Machine$double.eps)$RKB
print(eigen(RKB)$values)




