library(QRM)


### Name: Kendall
### Title: Kendall's Rank Correlation
### Aliases: Kendall
### Keywords: multivariate

### ** Examples

S <- equicorr(d = 3, rho = 0.5)
data <- rmnorm(1000, Sigma = S) 
Kendall(data) 



