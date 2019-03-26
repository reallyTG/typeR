library(qgam)


### Name: elf
### Title: Extended log-F model with fixed scale
### Aliases: elf

### ** Examples

library(qgam)
set.seed(2)
dat <- gamSim(1,n=400,dist="normal",scale=2)

# Fit median using elf directly: FAST BUT NOT RECOMMENDED
fit <- gam(y~s(x0)+s(x1)+s(x2)+s(x3), 
           family = elf(co = 0.1, qu = 0.5), data = dat)
plot(fit, scale = FALSE, pages = 1)     

# Using qgam: RECOMMENDED
fit <- qgam(y~s(x0)+s(x1)+s(x2)+s(x3), data=dat, err = 0.05, qu = 0.8)
plot(fit, scale = FALSE, pages = 1)      





