library(ahaz)


### Name: plot.ahazpen
### Title: Plot an ahazpen object
### Aliases: plot.ahazpen
### Keywords: hplot

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Fit additive hazards regression model
fit <- ahazpen(surv, X, dfmax=50)
par(mfrow=c(1,2)); plot(fit); plot(fit,xvar="lambda")

# With labels only
plot(fit,labels=TRUE,df=FALSE)



