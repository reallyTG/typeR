library(dfcrm)


### Name: getprior
### Title: Calibrating prior DLT rates
### Aliases: getprior
### Keywords: datasets

### ** Examples

target <- 0.25
delta <- 0.10
mtd0 <- 3

# initial DLT rates with indifference intervals [0.15, 0.35].
prior <- getprior(delta, target, mtd0, nlevel=6, model="logistic")



