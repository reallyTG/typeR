library(arm)


### Name: display
### Title: Functions for Processing lm, glm, mer, polr and svyglm Output
### Aliases: display display,lm-method display,bayesglm-method
###   display,glm-method display,merMod-method display,polr-method
###   display,svyglm-method
### Keywords: manip methods

### ** Examples
                          
# Here's a simple example of a model of the form, y = a + bx + error, 
# with 10 observations in each of 10 groups, and with both the 
# intercept and the slope varying by group.  First we set up the model and data.
   group <- rep(1:10, rep(10,10))
   group2 <- rep(1:10, 10)
   mu.a <- 0
   sigma.a <- 2
   mu.b <- 3
   sigma.b <- 4
   rho <- 0.56
   Sigma.ab <- array (c(sigma.a^2, rho*sigma.a*sigma.b, 
                    rho*sigma.a*sigma.b, sigma.b^2), c(2,2))
   sigma.y <- 1
   ab <- mvrnorm (10, c(mu.a,mu.b), Sigma.ab)
   a <- ab[,1]
   b <- ab[,2]
   d <- rnorm(10)

   x <- rnorm (100)
   y1 <- rnorm (100, a[group] + b*x, sigma.y)
   y2 <- rbinom(100, 1, prob=invlogit(a[group] + b*x))
   y3 <- rnorm (100, a[group] + b[group]*x + d[group2], sigma.y)
   y4 <- rbinom(100, 1, prob=invlogit(a[group] + b*x + d[group2]))


# display a simple linear model

   M1 <- lm (y1 ~ x)
   display (M1)
   M1.sim <- sim(M1, n.sims=2)  

# display a simple logit model

   M2 <- glm (y2 ~ x, family=binomial(link="logit"))
   display (M2)
   M2.sim <- sim(M2, n.sims=2)  

# Then fit and display a simple varying-intercept model:
 
   M3 <- lmer (y1 ~ x + (1|group))
   display (M3)
   M3.sim <- sim(M3, n.sims=2)  


# Then the full varying-intercept, varying-slope model:
 
   M4 <- lmer (y1 ~ x + (1 + x |group))
   display (M4)
   M4.sim <- sim(M4, n.sims=2)  

 
# Then the full varying-intercept, logit model:
 
   M5 <- glmer (y2 ~ x + (1|group), family=binomial(link="logit"))
   display (M5)
   M5.sim <- sim(M5, n.sims=2)  

 
# Then the full varying-intercept, varying-slope logit model:
 
   M6 <- glmer (y2 ~ x + (1|group) + (0 + x |group), 
        family=binomial(link="logit"))
   display (M6)
   M6.sim <- sim(M6, n.sims=2)  


# Then non-nested varying-intercept, varying-slop model:
   
   M7 <- lmer (y3 ~ x + (1 + x |group) + (1|group2))
   display(M7)
   M7.sim <- sim(M7, n.sims=2)  

 
# Then the ordered logit model from polr

   M8 <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
   display(M8)
   
   M9 <- bayespolr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
   display(M9) 
   




