library(flexmix)


### Name: ExLinear
### Title: Artificial Data from a Generalized Linear Regression Mixture
### Aliases: ExLinear
### Keywords: datasets

### ** Examples

## simple example in 2d
beta <- matrix(c(1, 2, 3, -1), ncol = 2)
sigma <- c(.5, 1)
df1 <- ExLinear(beta, 100, sd = sigma, min = -1, max = 2)
plot(y~x1, df1, col = attr(df1, "clusters"))

## add a second explanatory variable with exponential distribution
beta2 <- rbind(beta, c(-2, 2))
df2 <-  ExLinear(beta2, 100, sd = c(.5, 1),
                 xdist = c("runif", "rexp"),
                 xdist.args = list(list(min = -1, max = 2),
                                   list(rate = 3)))

summary(df2)

opar = par("mfrow")
par(mfrow = 1:2)
hist(df2$x1)
hist(df2$x2)
par(opar)

f1 <- flexmix(y ~ ., data = df2, k = 2)

## sort components on Intercept
f1 <- relabel(f1, "model", "Intercept")

## the parameters should be close to the true beta and sigma
round(parameters(f1), 3)
rbind(beta2, sigma)

### A simple Poisson GLM
df3 <- ExLinear(beta/2, 100, min = -1, max = 2, family = "poisson")
plot(y ~ x1, df3, col = attr(df3, "clusters"))

f3 <- flexmix(y ~ ., data = df3, k = 2,
              model = FLXMRglm(family = "poisson"))
round(parameters(relabel(f3, "model", "Intercept")), 3)
beta/2



