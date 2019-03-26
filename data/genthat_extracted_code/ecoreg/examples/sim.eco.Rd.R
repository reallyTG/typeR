library(ecoreg)


### Name: sim.eco
### Title: Simulate ecological data and samples of individual-level data
### Aliases: sim.eco
### Keywords: datagen

### ** Examples

N <- rep(50, 20)
ctx <- cbind(deprivation = rnorm(20), mean.income = rnorm(20))
phi <- cbind(nonwhite = runif(20), smoke = runif(20))
sim.df <- as.data.frame(cbind(ctx, phi))
mu <- qlogis(0.05)  ## Disease with approximate 5% prevalence
## Odds ratios for group-level deprivation and mean imcome
alpha.c <- c(1.01, 1.02)
## Odds ratios for individual-level ethnicity and smoking
alpha <- c(1.5, 2) 
sim.eco(N, ctx = ~ deprivation + mean.income, binary = ~ nonwhite +
        smoke, data=sim.df, mu=mu, alpha.c=alpha.c, alpha=alpha)
sim.eco(N, ctx = ~ deprivation + mean.income, binary = ~ nonwhite +
        smoke, data=sim.df, mu=mu, alpha.c=alpha.c, alpha=alpha, isam=3)



