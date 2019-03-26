library(betareg)


### Name: ReadingSkills
### Title: Dyslexia and IQ Predicting Reading Accuracy
### Aliases: ReadingSkills
### Keywords: datasets

### ** Examples

data("ReadingSkills", package = "betareg")

## Smithson & Verkuilen (2006, Table 5)
## OLS regression
## (Note: typo in iq coefficient: 0.3954 instead of 0.3594)
rs_ols <- lm(qlogis(accuracy) ~ dyslexia * iq, data = ReadingSkills)
summary(rs_ols)
## Beta regression (with numerical rather than analytic standard errors)
## (Note: Smithson & Verkuilen erroneously compute one-sided p-values)
rs_beta <- betareg(accuracy ~ dyslexia * iq | dyslexia + iq,
  data = ReadingSkills, hessian = TRUE)
summary(rs_beta)

## visualization
plot(accuracy ~ iq, data = ReadingSkills, col = as.numeric(dyslexia), pch = 19)
nd <- data.frame(dyslexia = "no", iq = -30:30/10)
lines(nd$iq, predict(rs_beta, nd))
lines(nd$iq, plogis(predict(rs_ols, nd)), lty = 2)
nd <- data.frame(dyslexia = "yes", iq = -30:30/10)
lines(nd$iq, predict(rs_beta, nd), col = 2)
lines(nd$iq, plogis(predict(rs_ols, nd)), col = 2, lty = 2)

## see demo("SmithsonVerkuilen2006", package = "betareg") for more details



