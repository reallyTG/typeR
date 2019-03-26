library(ahaz)


### Name: plot.ahaz
### Title: Plot an ahaz object
### Aliases: plot.ahaz
### Keywords: hplot

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,15:24])

# Fit additive hazards model
fit <- ahaz(surv, X)
plot(fit)



