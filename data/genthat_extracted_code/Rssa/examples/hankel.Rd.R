library(Rssa)


### Name: hmat
### Title: Hankel matrices operations.
### Aliases: new.hmat is.hmat hcols hrows hankel hmatmul

### ** Examples

# Construct the Hankel trajectory matrix for 'co2' series
h <- new.hmat(co2, L = 10)
# Print number of columns and rows
print(hrows(h))
print(hcols(h))



