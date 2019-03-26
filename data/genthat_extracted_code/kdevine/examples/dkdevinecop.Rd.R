library(kdevine)


### Name: dkdevinecop
### Title: Working with a 'kdevinecop' object
### Aliases: dkdevinecop dkevinecop rkdevinecop

### ** Examples

data(wdbc, package = "kdecopula")                    # load data
u <- VineCopula::pobs(wdbc[, 5:7], ties = "average") # rank-transform

fit <- kdevinecop(u)                # estimate density
dkdevinecop(c(0.1, 0.1, 0.1), fit)  # evaluate density estimate




