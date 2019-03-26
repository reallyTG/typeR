library(cplm)


### Name: cpglm
### Title: Compound Poisson Generalized Linear Models
### Aliases: cpglm
### Keywords: models

### ** Examples


fit1 <- cpglm(RLD ~ factor(Zone) * factor(Stock),
  data = FineRoot)
     
# residual and qq plot
parold <- par(mfrow = c(2, 2), mar = c(5, 5, 2, 1))
# 1. regular plot
r1 <- resid(fit1) / sqrt(fit1$phi)
plot(r1 ~ fitted(fit1), cex = 0.5)
qqnorm(r1, cex = 0.5)
# 2. quantile residual plot to avoid overlapping
u <- tweedie::ptweedie(fit1$y, fit1$p, fitted(fit1), fit1$phi)
u[fit1$y == 0] <- runif(sum(fit1$y == 0), 0, u[fit1$y == 0])
r2 <- qnorm(u)
plot(r2 ~ fitted(fit1), cex = 0.5)
qqnorm(r2, cex = 0.5)
par(parold)

# use bigglm 
fit2 <- cpglm(RLD ~ factor(Zone), 
  data = FineRoot, chunksize = 250)




