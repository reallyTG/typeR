library(arm)


### Name: sigma.hat
### Title: Extract Residual Errors
### Aliases: sigma.hat sigma.hat.lm sigma.hat.glm sigma.hat.merMod
###   sigma.hat.sim sigma.hat.sim.merMod
### Keywords: manip methods

### ** Examples

   group <- rep(1:10, rep(10,10))
   mu.a <- 0
   sigma.a <- 2
   mu.b <- 3
   sigma.b <- 4
   rho <- 0
   Sigma.ab <- array (c(sigma.a^2, rho*sigma.a*sigma.b,
                    rho*sigma.a*sigma.b, sigma.b^2), c(2,2))
   sigma.y <- 1
   ab <- mvrnorm (10, c(mu.a,mu.b), Sigma.ab)
   a <- ab[,1]
   b <- ab[,2]

   x <- rnorm (100)
   y1 <- rnorm (100, a[group] + b[group]*x, sigma.y)
   y2 <- rbinom(100, 1, prob=invlogit(a[group] + b*x))

   M1 <- lm (y1 ~ x)
   sigma.hat(M1)

   M2 <- bayesglm (y1 ~ x, prior.scale=Inf, prior.df=Inf)
   sigma.hat(M2) # should be same to sigma.hat(M1)

   M3 <- glm (y2 ~ x, family=binomial(link="logit"))
   sigma.hat(M3)

   M4 <- lmer (y1 ~ (1+x|group))
   sigma.hat(M4)

   M5 <- glmer (y2 ~ (1+x|group), family=binomial(link="logit"))
   sigma.hat(M5)




