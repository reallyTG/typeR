library(R.oo)


### Name: getName.environment
### Title: Gets the name of an environment
### Aliases: getName.environment
### Keywords: programming methods

### ** Examples

  name <- getName(globalenv())
  print(name)
  stopifnot(identical(name, "R_GlobalEnv"))

  getName(new.env())



