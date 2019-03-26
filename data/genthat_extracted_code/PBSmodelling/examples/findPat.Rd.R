library(PBSmodelling)


### Name: findPat
### Title: Search a Character Vector to Find Multiple Patterns
### Aliases: findPat
### Keywords: utilities

### ** Examples

local(envir=.PBSmodEnv,expr={
  #find all strings with a vowel, or that start with a number
  print(findPat(c("[aeiou]", "^[0-9]"), c("hello", "WORLD", "1over")))
})



