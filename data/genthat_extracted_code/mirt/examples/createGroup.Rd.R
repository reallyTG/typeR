library(mirt)


### Name: createGroup
### Title: Create a user defined group-level object with correct generic
###   functions
### Aliases: createGroup
### Keywords: createGroup

### ** Examples


# normal density example, N(mu, sigma^2)
den <- function(obj, Theta) dnorm(Theta, obj@par[1], sqrt(obj@par[2]))
par <- c(mu = 0, sigma2 = .5)
est <- c(FALSE, TRUE)
lbound <- c(-Inf, 0)
grp <- createGroup(par, est, den, nfact = 1, lbound=lbound)

dat <- expand.table(LSAT6)
mod <- mirt(dat, 1, 'Rasch')
modcustom <- mirt(dat, 1, 'Rasch', customGroup=grp)

coef(mod)
coef(modcustom)




