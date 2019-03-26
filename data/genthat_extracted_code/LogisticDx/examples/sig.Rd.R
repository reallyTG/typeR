library(LogisticDx)


### Name: sig
### Title: Significance tests for a binary regression models fit with 'glm'
### Aliases: sig sig.glm

### ** Examples

data(ageChd)
## H&L 2nd ed. Table 1.3. Page 10.
summary(g1 <- glm(chd ~ age, data=ageChd, family=binomial))
sig(g1)
data(lbw)
## Table 2.2. Page 36.
summary(g2 <- glm(LOW ~ AGE + LWT + RACE + FTV,
                  data=lbw, family=binomial))
sig(g2)
## Table 2.3. Pages 38-39.
summary(g3 <- glm(LOW ~ LWT + RACE,
                  data=lbw, family=binomial))
sig(g3, test="coef")
## RACE is more significant when dropped as a factor
##
sig(g3, test="var")



