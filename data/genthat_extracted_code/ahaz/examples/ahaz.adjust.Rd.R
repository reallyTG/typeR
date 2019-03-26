library(ahaz)


### Name: ahaz.adjust
### Title: Adjusted univariate association measures from ahaz
### Aliases: ahaz.adjust
### Keywords: models regression survival

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Adjust for first 10 covariates
idx <- 1:10
a <- ahaz.adjust(surv,X,idx=idx)

# Compare with (slower) solution
b <- apply(X[,-idx],2,function(x){coef(ahaz(surv,cbind(x,X[,idx])))[1]})
plot(b,a$adj[-idx])



