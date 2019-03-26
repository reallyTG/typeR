library(lcopula)


### Name: sliouv_m
### Title: Multiple marginal survival function for Liouville vectors
### Aliases: sliouv_m

### ** Examples

x <- rliouv(n = 100, family = "gumbel", alphavec <- c(2,3), theta = 2)
sliouv_m(x, family="gumbel", alphavec=c(2,3), theta=2)
all(sliouv_m(x, family="gumbel", alphavec=c(2,3), theta=2)[,1]-
  sliouvm(x[,1], family="gumbel", alpha=2, theta=2)==0)



