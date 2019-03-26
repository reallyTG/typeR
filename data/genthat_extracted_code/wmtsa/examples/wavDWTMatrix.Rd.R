library(wmtsa)


### Name: wavDWTMatrix
### Title: Discrete wavelet transform matrix.
### Aliases: wavDWTMatrix

### ** Examples

# Plot some rows of the wavelet transform matrix for the Haar filter
B <- wavDWTMatrix(wavelet = 'haar', J = 4)
wavStemPlot(B[1,])
wavStemPlot(B[15,])
wavStemPlot(B[16,])

# Compare the wavelet transform coefficients via the efficient
# wavDWT and non-efficient matrix multiplaction methods
N <- 256
X <- rnorm(N)
J0 <- 3
J <- as.integer(log2(N))
wavelet <- 's8'
W <- wavDWT(x = X, wavelet = wavelet, n.levels = J0)
B <- wavDWTMatrix(wavelet = wavelet, J = J, J0 = J0)
all.equal.numeric(as.vector(unlist(W$data)), as.vector(B %*% X))



