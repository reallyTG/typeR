library(mwaved)


### Name: multiProj
### Title: Meyer wavelet projection given a set of wavelet coefficients
### Aliases: multiProj

### ** Examples

library(mwaved)
# Make a noiseless doppler function
n <- 2^8
x <- (1:n)/n
y <- makeDoppler(n)
# Determine the wavelet coefficients
beta <- multiCoef(y)
# plot three raw wavelet expansions truncating in each case at j1 = 3, 4 and 5 respectively
plot(x, y, type = 'l', main = 'Doppler and wavelet projections at three different truncations')
j0 <- 3
j1 <- 5
j <- j0:j1
lcols <- c(1, j - j0 + 2)
ltys <-  c(1, 1:length(j))
matlines(x, sapply(j, function(i) multiProj(beta, j1 = i)), type = 'l', col = lcols[-1])
legend("bottomright", legend = c("Signal", paste('j1 =', j)), col = lcols, lty =ltys)



