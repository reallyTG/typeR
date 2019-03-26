library(arm)


### Name: sim
### Title: Functions to Get Posterior Distributions
### Aliases: sim sim-class sim.merMod-class sim,lm-method sim,glm-method
###   sim,polr-method sim,merMod-method coef.sim coef.sim.polr
###   coef.sim.merMod fixef.sim.merMod ranef.sim.merMod fitted.sim.merMod
### Keywords: models methods

### ** Examples

#Examples of "sim"
 set.seed (1)
 J <- 15
 n <- J*(J+1)/2
 group <- rep (1:J, 1:J)
 mu.a <- 5
 sigma.a <- 2
 a <- rnorm (J, mu.a, sigma.a)
 b <- -3
 x <- rnorm (n, 2, 1)
 sigma.y <- 6
 y <- rnorm (n, a[group] + b*x, sigma.y)
 u <- runif (J, 0, 3)
 y123.dat <- cbind (y, x, group)
# Linear regression
 x1 <- y123.dat[,2]
 y1 <- y123.dat[,1]
 M1 <- lm (y1 ~ x1)
 display(M1)
 M1.sim <- sim(M1)
 coef.M1.sim <- coef(M1.sim)
 sigma.M1.sim <- sigma.hat(M1.sim)
 ## to get the uncertainty for the simulated estimates
 apply(coef(M1.sim), 2, quantile)
 quantile(sigma.hat(M1.sim))

# Logistic regression
 u.data <- cbind (1:J, u)
 dimnames(u.data)[[2]] <- c("group", "u")
 u.dat <- as.data.frame (u.data)
 y <- rbinom (n, 1, invlogit (a[group] + b*x))
 M2 <- glm (y ~ x, family=binomial(link="logit"))
 display(M2)
 M2.sim <- sim (M2)
 coef.M2.sim <- coef(M2.sim)
 sigma.M2.sim <- sigma.hat(M2.sim)

# Ordered Logistic regression
house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
display(house.plr)
M.plr <- sim(house.plr)
coef.sim <- coef(M.plr, slot="coef")
zeta.sim <- coef(M.plr, slot="zeta")
coefall.sim <- coef(M.plr)

# Using lmer:
# Example 1
 E1 <- lmer (y ~ x + (1 | group))
 display(E1)
 E1.sim <- sim (E1)
 coef.E1.sim <- coef(E1.sim)
 fixef.E1.sim <- fixef(E1.sim)
 ranef.E1.sim <- ranef(E1.sim)
 sigma.E1.sim <- sigma.hat(E1.sim)
 yhat <- fitted(E1.sim, E1)

# Example 2
 u.full <- u[group]
 E2 <- lmer (y ~ x + u.full + (1 | group))
 display(E2)
 E2.sim <- sim (E2)
 coef.E2.sim <- coef(E2.sim)
 fixef.E2.sim <- fixef(E2.sim)
 ranef.E2.sim <- ranef(E2.sim)
 sigma.E2.sim <- sigma.hat(E2.sim)
 yhat <- fitted(E2.sim, E2)

# Example 3
 y <- rbinom (n, 1, invlogit (a[group] + b*x))
 E3 <- glmer (y ~ x + (1 | group), family=binomial(link="logit"))
 display(E3)
 E3.sim <- sim (E3)
 coef.E3.sim <- coef(E3.sim)
 fixef.E3.sim <- fixef(E3.sim)
 ranef.E3.sim <- ranef(E3.sim)
 sigma.E3.sim <- sigma.hat(E3.sim)
 yhat <- fitted(E3.sim, E3)



