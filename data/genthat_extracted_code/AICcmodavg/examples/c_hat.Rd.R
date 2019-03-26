library(AICcmodavg)


### Name: c_hat
### Title: Estimate Dispersion for Poisson and Binomial GLM's and GLMM's
### Aliases: c_hat c_hat.default c_hat.glm c_hat.merMod c_hat.vglm
###   print.c_hat
### Keywords: models

### ** Examples

#binomial glm example
set.seed(seed = 10)
resp <- rbinom(n = 60, size = 1, prob = 0.5)
set.seed(seed = 10)
treat <- as.factor(sample(c(rep(x = "m", times = 30), rep(x = "f",
                                           times = 30))))
age <- as.factor(c(rep("young", 20), rep("med", 20), rep("old", 20)))
#each invidual has its own response (n = 1)
mod1 <- glm(resp ~ treat + age, family = binomial)
## Not run: 
##D c_hat(mod1) #gives an error because model not appropriate for
##D ##computation of c-hat
## End(Not run)

##computing table to summarize successes
table(resp, treat, age)
dat2 <- as.data.frame(table(resp, treat, age)) #not quite what we need
data2 <- data.frame(success = c(9, 4, 2, 3, 5, 2),
                    sex = c("f", "m", "f", "m", "f", "m"),
                    age = c("med", "med", "old", "old", "young",
                      "young"), total = c(13, 7, 10, 10, 7, 13))
data2$prop <- data2$success/data2$total
data2$fail <- data2$total - data2$success

##run model with success/total syntax using weights argument
mod2 <- glm(prop ~ sex + age, family = binomial, weights = total,
            data = data2)
c_hat(mod2)

##run model with other syntax cbind(success, fail)
mod3 <- glm(cbind(success, fail) ~ sex + age, family = binomial,
            data = data2) 
c_hat(mod3)



