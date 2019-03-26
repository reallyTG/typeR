library(GB2)


### Name: Fisk
### Title: Parameters of the Fisk Distribution
### Aliases: Fisk fisk fiskh
### Keywords: distribution

### ** Examples

library(laeken)
data(eusilc)

# Income
inc <- as.vector(eusilc$eqIncome)

# Weights
w <- eusilc$rb050

#Fisk parameters
fpar <- fisk(inc, w)



