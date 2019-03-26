library(AER)


### Name: CPS1985
### Title: Determinants of Wages Data (CPS 1985)
### Aliases: CPS1985
### Keywords: datasets

### ** Examples

data("CPS1985")

## Berndt (1991)
## Exercise 2, p. 196
cps_2b <- lm(log(wage) ~ union + education, data = CPS1985)
cps_2c <- lm(log(wage) ~ -1 + union + education, data = CPS1985)

## Exercise 3, p. 198/199
cps_3a <- lm(log(wage) ~ education + experience + I(experience^2),
  data = CPS1985)
cps_3b <- lm(log(wage) ~ gender + education + experience + I(experience^2),
  data = CPS1985)
cps_3c <- lm(log(wage) ~ gender + married + education + experience + I(experience^2),
  data = CPS1985)
cps_3e <- lm(log(wage) ~ gender*married + education + experience + I(experience^2),
  data = CPS1985)

## Exercise 4, p. 199/200
cps_4a <- lm(log(wage) ~ gender + union + ethnicity + education + experience + I(experience^2),
  data = CPS1985)
cps_4c <- lm(log(wage) ~ gender + union + ethnicity + education * experience + I(experience^2),
  data = CPS1985)

## Exercise 6, p. 203
cps_6a <- lm(log(wage) ~ gender + union + ethnicity + education + experience + I(experience^2),
  data = CPS1985)
cps_6a_noeth <- lm(log(wage) ~ gender + union + education + experience + I(experience^2),
  data = CPS1985)
anova(cps_6a_noeth, cps_6a)

## Exercise 8, p. 208
cps_8a <- lm(log(wage) ~ gender + union + ethnicity + education + experience + I(experience^2),
  data = CPS1985)
summary(cps_8a)
coeftest(cps_8a, vcov = vcovHC(cps_8a, type = "HC0"))



