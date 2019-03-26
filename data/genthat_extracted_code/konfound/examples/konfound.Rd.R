library(konfound)


### Name: konfound
### Title: Perform sensitivity analysis on fitted models
### Aliases: konfound

### ** Examples

# using lm() for linear models
m1 <- lm(mpg ~ wt + hp, data = mtcars)
konfound(m1, wt)
konfound(m1, wt, test_all = TRUE)
konfound(m1, wt, to_return = "table")

# using glm() for non-linear models
if (requireNamespace("forcats")) {
d <- forcats::gss_cat

d$married <- ifelse(d$marital == "Married", 1, 0)

m2 <- glm(married ~ age, data = d, family = binomial(link = "logit"))
konfound(m2, age)
}

# using lme4 for mixed effects (or multi-level) models
if (requireNamespace("lme4")) {
library(lme4)
m3 <- fm1 <- lme4::lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
konfound(m3, Days)
}




