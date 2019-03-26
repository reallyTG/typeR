library(broom)


### Name: tidy.glmRob
### Title: Tidy a(n) glmRob object
### Aliases: tidy.glmRob

### ** Examples


library(robust)
m <- lmRob(mpg ~ wt, data = mtcars)

tidy(m)
augment(m)
glance(m)

gm <- glmRob(am ~ wt, data = mtcars, family = "binomial")
glance(gm)




