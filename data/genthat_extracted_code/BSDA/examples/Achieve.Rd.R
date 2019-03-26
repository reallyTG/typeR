library(BSDA)


### Name: Achieve
### Title: Math achievement test scores by gender for 25 high school
###   students
### Aliases: Achieve
### Keywords: datasets

### ** Examples


anova(lm(score ~ gender, data = Achieve))
t.test(score ~ gender, var.equal = TRUE, data = Achieve)




