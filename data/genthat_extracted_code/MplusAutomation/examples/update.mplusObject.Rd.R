library(MplusAutomation)


### Name: update.mplusObject
### Title: Update an Mplus model object
### Aliases: update.mplusObject
### Keywords: interface

### ** Examples

example1 <- mplusObject(MODEL = "mpg ON wt;",
  usevariables = c("mpg", "hp"), rdata = mtcars)
x <- ~ "ESTIMATOR = ML;"
str(update(example1, rdata = iris))
str(update(example1, ANALYSIS = x))
str(update(example1, MODEL = ~ "wt ON hp;"))
str(update(example1, MODEL = ~ . + "wt ON hp;"))
str(update(example1, ANALYSIS = x, MODEL = ~ . + "wt ON hp;"))

# test to make sure . in Mplus code does not cause problems
str(update(example1, ANALYSIS = x, MODEL = ~ . + "wt ON hp*.5;"))
rm(example1, x)



