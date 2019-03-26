library(ThresholdROC)


### Name: thresTH2
### Title: Population-based threshold computation (two-state setting)
### Aliases: thresTH2
### Keywords: threshold

### ** Examples

# example 1
dist1 <- "norm"
dist2 <- "norm"
par1.1 <- 0
par1.2 <- 1
par2.1 <- 2
par2.2 <- 1
rho <- 0.1

thresTH2(dist1, dist2, par1.1, par1.2, par2.1, par2.2, rho)


# example 2
dist1 <- "norm"
dist2 <- "lnorm"
par1.1 <- 0
par1.2 <- 1
par2.1 <- 1
par2.2 <- 0.5
rho <- 0.3

thresTH2(dist1, dist2, par1.1, par1.2, par2.1, par2.2, rho)



