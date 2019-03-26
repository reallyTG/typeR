library(broom)


### Name: tidy.lmRob
### Title: Tidy a(n) lmRob object
### Aliases: tidy.lmRob robust_tidiers

### ** Examples


library(robust)
m <- lmRob(mpg ~ wt, data = mtcars)

tidy(m)
augment(m)
glance(m)

gm <- glmRob(am ~ wt, data = mtcars, family = "binomial")
glance(gm)




