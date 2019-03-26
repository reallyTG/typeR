library(pubh)


### Name: Thall
### Title: RCT on the treatment of epilepsy.
### Aliases: Thall
### Keywords: datasets

### ** Examples

data(Thall)

c1 <- cbind(Thall[, c(1:5)], count = Thall$y1)[, c(1:4, 6)]
c2 <- cbind(Thall[, c(1:4, 6)], count = Thall$y2)[, c(1:4, 6)]
c3 <- cbind(Thall[, c(1:4, 7)], count = Thall$y3)[, c(1:4, 6)]
c4 <- cbind(Thall[, c(1:4, 8)], count = Thall$y3)[, c(1:4, 6)]
epilepsy <- rbind(c1, c2, c3, c4)

library(lme4, warn.conflicts = FALSE)
model_glmer <- glmer(count ~ treat + base + I(age - mean(age, na.rm = TRUE)) +
                 (1|id), data=epilepsy, family=poisson)
glm_coef(model_glmer, labels = c("Treatment (Prograbide/Control)",
                               "Baseline count", "Age (years)"))



