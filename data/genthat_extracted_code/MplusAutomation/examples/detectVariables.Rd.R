library(MplusAutomation)


### Name: detectVariables
### Title: Automatically detect variables from an Mplus model object
### Aliases: detectVariables
### Keywords: interface

### ** Examples


example1 <- mplusObject(MODEL = "mpg ON wt;",
  rdata = mtcars, autov = FALSE)
example1$usevariables
MplusAutomation:::detectVariables(example1)

example2 <- mplusObject(MODEL = "mpg ON wt;",
  rdata = mtcars, autov = TRUE)
example2$usevariables
example3 <- update(example2,
  MODEL = ~ . + "mpg ON qsec; wt WITH qsec;",
  autov = TRUE)
example3$usevariables
rm(example1, example2, example3)



