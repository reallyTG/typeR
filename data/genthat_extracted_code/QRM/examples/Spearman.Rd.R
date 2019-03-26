library(QRM)


### Name: Spearman
### Title: Spearman's Rank Correlation
### Aliases: Spearman
### Keywords: multivariate

### ** Examples

S <- equicorr(d = 3, rho = 0.5)
data <- rmnorm(1000, Sigma = S) 
Spearman(data) 



