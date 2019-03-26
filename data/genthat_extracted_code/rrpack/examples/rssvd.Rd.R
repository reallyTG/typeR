library(rrpack)


### Name: rssvd
### Title: Reduced-rank regression with a sparse singular value
###   decomposition
### Aliases: rssvd

### ** Examples

library(rrpack)
## Simulate data from a sparse factor regression model
p <- 50; q <- 50; n <- 100; nrank <- 3
mydata <- rrr.sim1(n, p, q, nrank, s2n = 1, sigma = NULL,
                   rho_X = 0.5, rho_E = 0.3)
fit1 <- with(mydata, rssvd(Y, X, nrank = nrank + 1))
summary(fit1)
plot(fit1)



