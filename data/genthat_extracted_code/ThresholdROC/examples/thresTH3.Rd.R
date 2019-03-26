library(ThresholdROC)


### Name: thresTH3
### Title: Population-based threshold computation (three-state setting)
### Aliases: thresTH3
### Keywords: threshold

### ** Examples

# example 1
dist <- "norm"
par1.1 <- 0
par1.2 <- 1
par2.1 <- 2
par2.2 <- 1
par3.1 <- 4
par3.2 <- 1
rho <- c(1/3, 1/3, 1/3)

thresTH3(dist, dist, dist,
  par2.1, par2.2, par1.1, par1.2,
  par3.1, par3.2, rho)
  
  
# example 2
dist1 <- "norm"
dist2 <- "lnorm"
dist3 <- "lnorm"
par1.1 <- 0
par1.2 <- 1
par2.1 <- 1
par2.2 <- 0.5
par3.1 <- 2
par3.2 <- 0.5
rho <- rep(1/3, 3)

thresTH3(dist1, dist2, dist3, par1.1, par1.2, par2.1, par2.2, par3.1, par3.2, rho)



