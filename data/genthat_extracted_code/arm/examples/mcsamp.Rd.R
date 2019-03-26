library(arm)


### Name: mcsamp
### Title: Generic Function to Run 'mcmcsamp()' in lme4
### Aliases: mcsamp mcsamp.default mcsamp,merMod-method
### Keywords: models methods

### ** Examples

## Here's a simple example of a model of the form, y = a + bx + error, 
## with 10 observations in each of 10 groups, and with both the intercept 
## and the slope varying by group.  First we set up the model and data.
##   
#   group <- rep(1:10, rep(10,10))
#   group2 <- rep(1:10, 10)
#   mu.a <- 0
#   sigma.a <- 2
#   mu.b <- 3
#   sigma.b <- 4
#   rho <- 0.56
#   Sigma.ab <- array (c(sigma.a^2, rho*sigma.a*sigma.b, 
#                    rho*sigma.a*sigma.b, sigma.b^2), c(2,2))
#   sigma.y <- 1
#   ab <- mvrnorm (10, c(mu.a,mu.b), Sigma.ab)
#   a <- ab[,1]
#   b <- ab[,2]
#   d <- rnorm(10)
#
#   x <- rnorm (100)
#   y1 <- rnorm (100, a[group] + b*x, sigma.y)
#   y2 <- rbinom(100, 1, prob=invlogit(a[group] + b*x))
#   y3 <- rnorm (100, a[group] + b[group]*x + d[group2], sigma.y)
#   y4 <- rbinom(100, 1, prob=invlogit(a[group] + b*x + d[group2]))
#
## 
## Then fit and display a simple varying-intercept model:
# 
#   M1 <- lmer (y1 ~ x + (1|group))
#   display (M1)
#   M1.sim <- mcsamp (M1)
#   print (M1.sim)
#   plot (M1.sim)
## 
## Then the full varying-intercept, varying-slope model:
## 
#   M2 <- lmer (y1 ~ x + (1 + x |group))
#   display (M2)
#   M2.sim <- mcsamp (M2)
#   print (M2.sim)
#   plot (M2.sim)
## 
## Then the full varying-intercept, logit model:
## 
#   M3 <- lmer (y2 ~ x + (1|group), family=binomial(link="logit"))
#   display (M3)
#   M3.sim <- mcsamp (M3)
#   print (M3.sim)
#   plot (M3.sim)
## 
## Then the full varying-intercept, varying-slope logit model:
## 
#   M4 <- lmer (y2 ~ x + (1|group) + (0+x |group), 
#        family=binomial(link="logit"))
#   display (M4)
#   M4.sim <- mcsamp (M4)
#   print (M4.sim)
#   plot (M4.sim)
#   
##
## Then non-nested varying-intercept, varying-slop model:
##
#   M5 <- lmer (y3 ~ x + (1 + x |group) + (1|group2))
#   display(M5)
#   M5.sim <- mcsamp (M5)
#   print (M5.sim)
#   plot (M5.sim)
      
 


