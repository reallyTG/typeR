library(ahaz)


### Name: ahaz
### Title: Fit semiparametric additive hazards model
### Aliases: ahaz
### Keywords: models regression survival

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,15:24])

# Fit additive hazards model
fit1 <- ahaz(surv, X)
summary(fit1)

# Univariate models
X <- as.matrix(sorlie[,3:ncol(sorlie)])
fit2 <- ahaz(surv, X, univariate = TRUE)
# Equivalent to the following (slower) solution
beta <- apply(X,2,function(x){coef(ahaz(surv,x))})
plot(beta,coef(fit2))




