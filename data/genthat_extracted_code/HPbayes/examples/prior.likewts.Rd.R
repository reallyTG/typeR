library(HPbayes)


### Name: prior.likewts
### Title: Prior likelihoods and weights
### Aliases: prior.likewts
### Keywords: misc

### ** Examples

lx <- c(1974, 1906, 1860, 1844, 1834, 1823, 1793, 1700, 1549, 1361, 
1181, 1025, 870, 721, 571, 450, 344, 256, 142, 79, 41, 8)
dx <- c(68, 47, 16, 10, 13, 29, 92, 151, 188, 179, 156, 155, 147, 150, 
122, 106, 88, 113, 63, 38, 32, 8)
age <- c(1e-05, 1, seq(5, 85, 5))
q0 <- prior.form()
result <- prior.likewts(prior=q0, nrisk=lx, ndeath=dx, age=age)
summary(result$wts.0)
summary(result$log.like.0)



