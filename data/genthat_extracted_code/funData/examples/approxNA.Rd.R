library(funData)


### Name: approxNA
### Title: Approximate missing values for funData objects
### Aliases: approxNA

### ** Examples

# Simulate some data
f <- simFunData(N = 10, M = 8, eVal = "linear", eFun = "Poly", argvals = seq(0, 1, 0.01))$simData

# Sparsify, i.e. generate artificial missings in the data
fSparse <- sparsify(f, minObs = 10, maxObs = 50)

# plot
oldpar <- par(no.readonly = TRUE)
par(mfrow = c(1,3))
plot(f, main = "Original Data") 
plot(fSparse, main = "Sparse Data")
plot(approxNA(fSparse), main = "Reconstructed Data")
# faster with plot(fSparse, plotNA = TRUE, main = "Reconstructed Data")

par(oldpar)



