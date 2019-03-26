library(ahaz)


### Name: summary.ahaz
### Title: Summarize an ahaz object
### Aliases: summary.ahaz
### Keywords: methods

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,15:25])

# Fit additive hazards model
fit1 <- ahaz(surv, X)
summary(fit1)



