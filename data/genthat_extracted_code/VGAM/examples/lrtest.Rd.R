library(VGAM)


### Name: lrtest
### Title: Likelihood Ratio Test of Nested Models
### Aliases: lrtest lrtest_vglm
### Keywords: htest

### ** Examples

set.seed(1)
pneumo <- transform(pneumo, let = log(exposure.time), x3 = runif(nrow(pneumo)))
fit1 <- vglm(cbind(normal, mild, severe) ~ let     , propodds, data = pneumo)
fit2 <- vglm(cbind(normal, mild, severe) ~ let + x3, propodds, data = pneumo)
fit3 <- vglm(cbind(normal, mild, severe) ~ let     , cumulative, data = pneumo)
# Various equivalent specifications of the LR test for testing x3
(ans1 <- lrtest(fit2, fit1))
ans2 <- lrtest(fit2, 2)
ans3 <- lrtest(fit2, "x3")
ans4 <- lrtest(fit2, . ~ . - x3)
c(all.equal(ans1, ans2), all.equal(ans1, ans3), all.equal(ans1, ans4))

# Doing it manually
(testStatistic <- 2 * (logLik(fit2) - logLik(fit1)))
(mypval <- pchisq(testStatistic, df = length(coef(fit2)) - length(coef(fit1)),
                  lower.tail = FALSE))

(ans4 <- lrtest(fit3, fit1))  # Test proportional odds (parallelism) assumption



