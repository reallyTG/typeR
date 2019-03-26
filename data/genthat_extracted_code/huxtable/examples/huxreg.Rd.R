library(huxtable)


### Name: huxreg
### Title: Create a huxtable to display model output
### Aliases: huxreg

### ** Examples


lm1 <- lm(mpg ~ cyl, mtcars)
lm2 <- lm(mpg ~ cyl + hp, mtcars)
glm1 <- glm(I(mpg > 20) ~ cyl, mtcars,
      family = binomial)

huxreg(lm1, lm2, glm1)




