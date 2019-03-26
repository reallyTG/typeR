library(Rssa)


### Name: tmat
### Title: Toeplitz matrices operations.
### Aliases: new.tmat is.tmat tcols trows tmatmul

### ** Examples

# Construct the Toeplitz version of the autocovariance matrix for 'co2' series
h <- new.tmat(co2, L = 10)
# Print the number of columns and rows
print(trows(h)); print(tcols(h))



