library(vcdExtra)


### Name: Donner
### Title: Survival in the Donner Party
### Aliases: Donner
### Keywords: datasets

### ** Examples

# conditional density plots
op <- par(mfrow=c(1,2), cex.lab=1.5)
cdplot(factor(survived) ~ age, subset=sex=='Male', data=Donner, 
    main="Donner party: Males", ylevels=2:1, ylab="Survived", yaxlabels=c("yes", "no"))
with(Donner, rug(jitter(age[sex=="Male"]), col="white", quiet=TRUE))
cdplot(factor(survived) ~ age, subset=sex=='Female', data=Donner, 
    main="Donner party: Females", ylevels=2:1, ylab="Survived", yaxlabels=c("yes", "no"))
with(Donner, rug(jitter(age[sex=="Female"]), col="white", quiet=TRUE))
par(op)


# fit some models
(mod1 <- glm(survived ~ age + sex, data=Donner, family=binomial))
(mod2 <- glm(survived ~ age * sex, data=Donner, family=binomial))
anova(mod2, test="Chisq")

(mod3 <- glm(survived ~ poly(age,2) * sex, data=Donner, family=binomial))
anova(mod3, test="Chisq")
LRstats(glmlist(mod1, mod2, mod3))

# plot fitted probabilities from mod2 and mod3
# idea from: http://www.ling.upenn.edu/~joseff/rstudy/summer2010_ggplot2_intro.html
library(ggplot2)

# separate linear fits on age for M/F
ggplot(Donner, aes(age, survived, color = sex)) +
  geom_point(position = position_jitter(height = 0.02, width = 0)) +
  stat_smooth(method = "glm", method.args = list(family = binomial), formula = y ~ x,
           alpha = 0.2, size=2, aes(fill = sex))

# separate quadratics
ggplot(Donner, aes(age, survived, color = sex)) +
  geom_point(position = position_jitter(height = 0.02, width = 0)) +
  stat_smooth(method = "glm", method.args = list(family = binomial), formula = y ~ poly(x,2),
           alpha = 0.2, size=2, aes(fill = sex))





