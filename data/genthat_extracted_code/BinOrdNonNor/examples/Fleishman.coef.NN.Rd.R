library(BinOrdNonNor)


### Name: Fleishman.coef.NN
### Title: Computes the Fleishman coefficients for each continuous variable
### Aliases: Fleishman.coef.NN

### ** Examples

# Consider four continuous variables, which come from
# Exp(1),Beta(4,4),Beta(4,2) and Gamma(10,10), respectively.
# Skewness and kurtosis values of these variables are as follows:

skew.vec <- c(2,0,-0.4677,0.6325)
kurto.vec <- c(6,-0.5455,-0.3750,0.6)
coef.est <- Fleishman.coef.NN(skew.vec, kurto.vec)



