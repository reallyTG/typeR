library(MASS)


### Name: anova.negbin
### Title: Likelihood Ratio Tests for Negative Binomial GLMs
### Aliases: anova.negbin
### Keywords: regression

### ** Examples

m1 <- glm.nb(Days ~ Eth*Age*Lrn*Sex, quine, link = log)
m2 <- update(m1, . ~ . - Eth:Age:Lrn:Sex)
anova(m2, m1)
anova(m2)



