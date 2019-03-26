library(MplusAutomation)


### Name: mplusObject
### Title: Create an Mplus model object
### Aliases: mplusObject
### Keywords: interface

### ** Examples


example1 <- mplusObject(MODEL = "mpg ON wt;",
  usevariables = c("mpg", "hp"), rdata = mtcars)
str(example1)
rm(example1)

# R figures out the variables automagically, with a message
example2 <- mplusObject(MODEL = "mpg ON wt;",
  rdata = mtcars, autov = TRUE)
str(example2)
rm(example2)

# R can also try to figure out a list of variables when
# variable names are hyphenated first-last variable, all variables
# between the first and last one will be included
example3 <- mplusObject(MODEL = "mpg ON wt-vs;",
  rdata = mtcars, autov = TRUE)
str(example3)
rm(example3)

# R warns if the first 8 characters of a (used) variable name are not unique
# as they will be indistinguishable in the Mplus output
example4 <- mplusObject(MODEL = "basename_01 ON basename_02;",
  rdata = data.frame(basename_01 = 1:5, basename_02 = 5:1),
  autov = TRUE)
rm(example4)



