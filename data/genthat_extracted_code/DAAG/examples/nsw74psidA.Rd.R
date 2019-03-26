library(DAAG)


### Name: nsw74psidA
### Title: A Subset of the nsw74psid1 Data Set
### Aliases: nsw74psidA
### Keywords: datasets

### ** Examples

table(nsw74psidA$trt)
A1.lm <- lm(re78 ~ trt + (age + educ + re74 + re75) + (black +
      hisp + marr + nodeg), data = nsw74psidA)
summary(A1.lm)$coef
discA.glm <- glm(formula = trt ~ age + educ + black + hisp +
  marr + nodeg + re74 + re75, family = binomial, data = nsw74psidA)
A.scores <- predict(discA.glm)
options(digits=4)
overlap <- A.scores > -3.5 & A.scores < 3.8
A.lm <- lm(re78 ~ trt + A.scores, data=nsw74psidA, subset = overlap)
summary(A.lm)$coef



