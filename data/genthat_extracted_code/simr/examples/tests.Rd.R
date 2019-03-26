library(simr)


### Name: tests
### Title: Specify a statistical test to apply
### Aliases: tests fixed compare fcompare rcompare random

### ** Examples

lm1 <- lmer(y ~ x + (x|g), data=simdata)
lm0 <- lmer(y ~ x + (1|g), data=simdata)
anova(lm1, lm0)
compare(. ~ x + (1|g))(lm1)
rcompare(~ (1|g))(lm1)
## Not run: powerSim(fm1, compare(. ~ x + (1|g)))




