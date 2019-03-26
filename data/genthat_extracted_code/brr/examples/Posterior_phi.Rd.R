library(brr)


### Name: Posterior_phi
### Title: Posterior distribution on the relative risk and the vaccine
###   efficacy
### Aliases: Posterior_phi dpost_VE dpost_phi ppost_VE ppost_phi qpost_VE
###   qpost_phi rpost_phi spost_phi

### ** Examples

a <- 2; b <- 2; c <- 3; d <- 4; S <- 1; T <- 1; x <- 2; y <- 6
spost_phi(a, b, c, d, S, T, x, y, output="pandoc")
require(magrittr)
phi <- seq(0, 6, length.out=100)
phi %>% { plot(., dpost_phi(., a, b, c, d, S, T, x, y), type="l") }
phi %>% { lines(., dprior_phi(., b, c, d, S, T),  col="red") }



