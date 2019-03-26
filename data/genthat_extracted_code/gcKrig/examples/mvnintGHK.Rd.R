library(gcKrig)


### Name: mvnintGHK
### Title: Computing Multivariate Normal Rectangle Probability
### Aliases: mvnintGHK
### Keywords: Estimation

### ** Examples

mvnintGHK(mean = rep(0, 51), sigma =  diag(0.2, 51) + matrix(0.8, 51, 51),
          lower = rep(-2,51), upper = rep(2,51), nrep = 10000)



