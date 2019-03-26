library(arm)


### Name: se.coef
### Title: Extract Standard Errors of Model Coefficients
### Aliases: se.coef se.coef,lm-method se.coef,glm-method
###   se.coef,merMod-method se.fixef se.ranef
### Keywords: manip methods models

### ** Examples

# Here's a simple example of a model of the form, y = a + bx + error,
# with 10 observations in each of 10 groups, and with both the
# intercept and the slope varying by group.  First we set up the model and data.

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
#
   x <- rnorm (100)
   y1 <- rnorm (100, a[group] + b[group]*x, sigma.y)
   y2 <- rbinom(100, 1, prob=invlogit(a[group] + b*x))

#  lm fit
   M1 <- lm (y1 ~ x)
   se.coef (M1)

#  glm fit
   M2 <- glm (y2 ~ x)
   se.coef (M2)

#  lmer fit
   M3 <- lmer (y1 ~ x + (1 + x |group))
   se.coef (M3)
   se.fixef (M3)
   se.ranef (M3)

#  glmer fit
   M4 <- glmer (y2 ~ 1 + (0 + x |group), family=binomial(link="logit"))
   se.coef (M4)
   se.fixef (M4)
   se.ranef (M4)



