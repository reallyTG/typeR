library(mistat)


### Name: STRESS
### Title: Stress Levels
### Aliases: STRESS
### Keywords: datasets

### ** Examples

data(STRESS)

summary(                                       
  aov(stress ~ (A+B+C)^3 +I(A^2)+I(B^2)+I(C^2),
      data=STRESS))



