library(LogisticDx)


### Name: ss
### Title: *S*ample *s*ize for a given coefficient and events per covariate
###   for model
### Aliases: ss ss.glm
### Keywords: htest

### ** Examples

## H&L 2nd ed. Section 8.5.
## Results here are slightly different from the text due to rounding.
data(uis)
with(uis, prop.table(table(DFREE, TREAT), 2))
(g1 <- glm(DFREE ~ TREAT, data=uis, family=binomial))
ss(g1, coeff="TREATlong")
## Pages 340 - 341.
ss(g1, coeff="TREATlong", OR=1.5, Px0=0.5)
## standardize
uis <- within(uis, {
    AGES <- (AGE - 32) / 6
    NDRGTXS <- (NDRGTX - 5) / 5
})
## Page 343.
## results slightly different due to rounding
g1 <- glm(DFREE ~ AGES, data=uis, family=binomial)
ss(g1, coeff="AGES", std=FALSE, OR=1.5)
## Table 8.37. Page 344.
summary(g1 <- glm(DFREE ~ AGES + NDRGTXS + IVHX + RACE + TREAT,
                  data=uis, family=binomial))
## Page 345.
## results slightly different due to rounding
ss(g1, coeff="AGES", std=FALSE, OR=1.5)
ss(g1, coeff="TREATlong", std=FALSE, OR=1.5)



